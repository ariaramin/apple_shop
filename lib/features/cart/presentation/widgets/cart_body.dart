import 'package:apple_shop/config/component/app_button.dart';
import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_event.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_state.dart';
import 'package:apple_shop/features/cart/presentation/widgets/cart_detail.dart';
import 'package:apple_shop/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CartBody extends StatefulWidget {
  const CartBody({
    super.key,
  });

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  int _totalPrice = 0;
  int _totalDiscount = 0;
  int _finalPrice = 0;

  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(const FetchCartItemsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: "سبد خرید",
                centerTitle: true,
                titleColor: AppColors.primaryColor,
                leadingIcon: SvgPicture.asset(
                  "assets/icons/apple.svg",
                  color: AppColors.primaryColor,
                ),
                visibleEndIcon: false,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 12,
              ),
              sliver: BlocConsumer<CartBloc, CartState>(
                listener: (context, state) {
                  if (state is CartItemListResponse) {
                    setState(() {
                      _finalPrice = state.cartItemList.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.realPrice!);
                      _totalPrice = state.cartItemList.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.price!);
                      _totalDiscount = state.cartItemList.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.discountPrice!);
                    });
                  }
                },
                builder: (context, state) {
                  if (state is CartLoadingState) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is CartItemListResponse) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CartItem(
                            cartItem: state.cartItemList[index],
                          );
                        },
                        childCount: state.cartItemList.length,
                      ),
                    );
                  }
                  return const SliverToBoxAdapter();
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 58,
              ),
              sliver: SliverToBoxAdapter(
                child: Visibility(
                  visible: _finalPrice != 0,
                  child: CartDetail(
                      totalPrice: _totalPrice,
                      finalPrice: _finalPrice,
                      totalDiscount: _totalDiscount),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: AppButton(
            onPressed: () {},
            text: "ادامه فرآیند خرید",
          ),
        ),
      ],
    );
  }
}
