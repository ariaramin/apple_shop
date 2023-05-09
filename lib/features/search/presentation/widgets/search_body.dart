import 'package:apple_shop/config/component/product_item.dart';
import 'package:apple_shop/features/search/presentation/bloc/search_bloc.dart';
import 'package:apple_shop/features/search/presentation/bloc/search_event.dart';
import 'package:apple_shop/features/search/presentation/bloc/search_state.dart';
import 'package:apple_shop/features/search/presentation/widgets/custom_back_button.dart';
import 'package:apple_shop/features/search/presentation/widgets/search_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({
    super.key,
  });

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(SearchRequest(text: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomBackButton(),
              Expanded(
                child: SearchField(
                  onChange: (value) {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchRequest(text: value));
                  },
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchLoadingState) {
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
            if (state is SearchResponseState) {
              return state.productList.fold(
                (failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message ?? "")),
                  );
                },
                (response) {
                  if (response.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text('محصول مورد نظر پیدا نشد!'),
                      ),
                    );
                  }
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
            return const SliverFillRemaining();
          },
        ),
      ],
    );
  }
}
