import 'package:apple_shop/config/component/cashed_image.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/feature/category/presentation/bloc/category_bloc.dart';
import 'package:apple_shop/feature/category/presentation/bloc/category_event.dart';
import 'package:apple_shop/feature/category/presentation/bloc/category_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequest());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (state is CategoryResponseState) {
                  state.response.fold(
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
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: CachedImage(
                                  imageUrl: categoryList[index].thumbnail,
                                ),
                              );
                            },
                            childCount: categoryList.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                        ),
                      );
                    },
                  );
                }
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('مشکلی پیش آمده است.'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}