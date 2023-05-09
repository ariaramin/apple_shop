import 'package:apple_shop/config/component/cached_image.dart';
import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/features/category/presentation/bloc/category_bloc.dart';
import 'package:apple_shop/features/category/presentation/bloc/category_event.dart';
import 'package:apple_shop/features/category/presentation/bloc/category_state.dart';
import 'package:apple_shop/features/product/presentation/arguments/product_list_arguments.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({
    super.key,
  });

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequest());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<CategoryBloc>(context).add(CategoryRequest());
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBar(
              title: "دسته بندی",
              titleColor: AppColors.primaryColor,
              centerTitle: true,
              leadingIcon: SvgPicture.asset(
                "assets/icons/apple.svg",
                color: AppColors.primaryColor,
              ),
              visibleEndIcon: false,
            ),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
            if (state is CategoryLoadingState) {
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
            if (state is CategoryResponseState) {
              return state.response.fold(
                (failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message ?? "")),
                  );
                },
                (categoryList) {
                  return SliverPadding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 22,
                    ),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRouteName.productList,
                                arguments: ProductListArguments(
                                  title: categoryList[index].title!,
                                  filter: Filter(
                                    filterSequence:
                                        "category='${categoryList[index].id}'",
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: CachedImage(
                                imageUrl: categoryList[index].thumbnail,
                              ),
                            ),
                          );
                        },
                        childCount: categoryList.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
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
          }),
        ],
      ),
    );
  }
}
