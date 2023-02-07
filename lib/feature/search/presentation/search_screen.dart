import 'package:apple_shop/config/component/product_item.dart';
import 'package:apple_shop/feature/search/presentation/bloc/search_bloc.dart';
import 'package:apple_shop/feature/search/presentation/bloc/search_event.dart';
import 'package:apple_shop/feature/search/presentation/bloc/search_state.dart';
import 'package:apple_shop/feature/search/presentation/widgets/search_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(SearchRequest(text: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _getContent(context),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SearchField(
                  onChange: (value) {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchRequest(text: value));
                  },
                ),
              ),
              _getBackButton(context),
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

  Widget _getBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: SizedBox(
              width: 24,
              child: SvgPicture.asset(
                "assets/icons/arrow-right.svg",
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
