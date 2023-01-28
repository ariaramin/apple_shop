import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/home/domain/get_banners.dart';
import 'package:apple_shop/feature/home/presentation/bloc/home_event.dart';
import 'package:apple_shop/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBanners _getBanners = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<BannerRequest>(
      (event, emit) async {
        emit(HomeLoadingState());
        var response = await _getBanners.call(null);
        emit(BannerResponseState(response));
      },
    );
  }
}
