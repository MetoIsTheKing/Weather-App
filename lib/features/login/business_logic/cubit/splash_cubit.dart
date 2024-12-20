import 'package:bloc/bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startSplashTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      emit(SplashLoaded());
    });
  }

}

