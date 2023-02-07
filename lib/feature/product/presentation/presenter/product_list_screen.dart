import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/component/product_item.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/product/presentation/argument/product_list_arguments.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_bloc.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_event.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  final ProductListArguments arguments;
  const ProductListScreen({
    super.key,
    required this.arguments,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(
      ProductListRequest(filter: widget.arguments.filter),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<ProductBloc>(context).add(
              ProductListRequest(filter: widget.arguments.filter),
            );
          },
          child: _getContent(),
        ),
      ),
    );
  }

  Widget _getContent() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(
            title: widget.arguments.title,
            titleColor: AppColors.primaryColor,
            centerTitle: true,
            leadingIcon: SvgPicture.asset(
              "assets/icons/filter.svg",
            ),
            endIcon: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                "assets/icons/arrow-right.svg",
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            visibleEndIcon: true,
          ),
        ),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const SliverFillRemaining(
                child: Center(
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            if (state is ProductResponseState) {
              return state.productList.fold(
                (failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message ?? "")),
                  );
                },
                (response) {
                  return SliverPadding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 22,
                    ),
                    sliver: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return ProductItem(
                              product: response[index],
                            );
                          },
                          childCount: response.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.6,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 24,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SliverFillRemaining(
              child: Center(
                child: Text('مشکلی پیش آمده است'),
              ),
            );
          },
        ),
      ],
    );
  }
}
