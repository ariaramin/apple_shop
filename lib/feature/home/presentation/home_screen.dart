import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/feature/home/presentation/bloc/home_bloc.dart';
import 'package:apple_shop/feature/home/presentation/bloc/home_event.dart';
import 'package:apple_shop/feature/home/presentation/bloc/home_state.dart';
import 'package:apple_shop/feature/home/presentation/widgets/banner_slider.dart';
import 'package:apple_shop/feature/home/presentation/widgets/category_list.dart';
import 'package:apple_shop/feature/home/presentation/widgets/product_list.dart';
import 'package:apple_shop/feature/home/presentation/widgets/section_title.dart';
import 'package:apple_shop/feature/product/presentation/argument/product_list_arguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // BlocProvider.of<HomeBloc>(context).add(BannerRequest());
    // BlocProvider.of<HomeBloc>(context).add(CategoryRequest());
    BlocProvider.of<HomeBloc>(context).add(HomeInitRequest());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<HomeBloc>(context).add(HomeInitRequest());
          },
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRouteName.search,
                  );
                },
                child: CustomAppBar(
                  title: "جستجوی محصولات",
                  centerTitle: false,
                  leadingIcon: SvgPicture.asset(
                    "assets/icons/apple.svg",
                    color: AppColors.primaryColor,
                  ),
                  endIcon: SvgPicture.asset("assets/icons/search.svg"),
                  visibleEndIcon: true,
                ),
              ),
            ),
            if (state is HomeLoadingState) ...{
              const SliverFillRemaining(
                child: Center(
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            },
            if (state is HomeResponseState) ...{
              // get banners
              state.bannerList.fold(
                (failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message ?? "")),
                  );
                },
                (response) {
                  return SliverToBoxAdapter(
                    child: BannerSlider(bannerList: response),
                  );
                },
              ),

              // get categories
              state.categoryList.fold(
                (failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message ?? "")),
                  );
                },
                (response) {
                  return SliverPadding(
                    padding: const EdgeInsets.only(top: 28, bottom: 18),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: CategoryList(categoryList: response),
                      ),
                    ),
                  );
                },
              ),

              SliverToBoxAdapter(
                child: SectionTitle(
                  title: "پربازدید ترین ها",
                  visibleLeadingText: true,
                  leadingTextOnTap: () {
                    Navigator.of(context).pushNamed(
                      AppRouteName.productList,
                      arguments: ProductListArguments(
                        title: "پربازدید ترین ها",
                        filter: const Filter(
                          filterSequence: "popularity='Hotest'",
                        ),
                      ),
                    );
                  },
                ),
              ),

              // get hotest products
              state.hotestProductList.fold(
                (failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message ?? "")),
                  );
                },
                (response) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: ProductList(
                        productList: response,
                      ),
                    ),
                  );
                },
              ),

              SliverToBoxAdapter(
                child: SectionTitle(
                  title: "پرفروش ترین ها",
                  visibleLeadingText: true,
                  leadingTextOnTap: () {
                    Navigator.of(context).pushNamed(
                      AppRouteName.productList,
                      arguments: ProductListArguments(
                        title: "پرفروش ترین ها",
                        filter: const Filter(
                          filterSequence: "popularity='Best Seller'",
                        ),
                      ),
                    );
                  },
                ),
              ),

              // get bestseller products
              state.bestSellerProductList.fold(
                (failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message ?? "")),
                  );
                },
                (response) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: ProductList(
                        productList: response,
                      ),
                    ),
                  );
                },
              ),
            },
          ],
        );
      },
    );
  }
}
