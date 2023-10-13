import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naira_convertor/core/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(const HomeState(
            fcfaCurrency: 0, nairaCurrency: 0, status: HomeStatus.initial)) {
    on<HomeInitEvent>(_init);
    on<HomeNairaCurrencyInputEvent>(_nairaCurrency);
    on<HomeFcfaCurrencyInputEvent>(_fcfaCurrency);
    on<HomeConvertorInputEvent>(_convertor);
    on<HomeDropChangeEvent>(_dropChange);
  }

  late SharedPreferences prefs;

  void _init(HomeInitEvent event, Emitter<HomeState> emit) async {
    prefs = await SharedPreferences.getInstance();

    double? nairaCurrency = prefs.getDouble(ConvertorConst.nairaCurrency);
    double? fcfaCurrency = prefs.getDouble(ConvertorConst.fcfaCurrency);

    emit(state.copyWith(
        nairaCurrency: nairaCurrency, fcfaCurrency: fcfaCurrency));
  }

  void _nairaCurrency(
      HomeNairaCurrencyInputEvent event, Emitter<HomeState> emit) {
    try {
      double v =
          double.parse(event.nairaCurrency == '' ? '0' : event.nairaCurrency);
      prefs.setDouble(ConvertorConst.nairaCurrency, v);
      emit(state.copyWith(status: HomeStatus.initial, nairaCurrency: v));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  void _fcfaCurrency(
      HomeFcfaCurrencyInputEvent event, Emitter<HomeState> emit) {
    try {
      double v =
          double.parse(event.fcfaCurrency == '' ? '0' : event.fcfaCurrency);
      prefs.setDouble(ConvertorConst.fcfaCurrency, v);
      emit(state.copyWith(status: HomeStatus.initial, fcfaCurrency: v));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  void _convertor(HomeConvertorInputEvent event, Emitter<HomeState> emit) {
    try {
      // Convertion de l'entré
      double value = double.parse(event.inputFirstConvertorValue == ''
          ? '0'
          : event.inputFirstConvertorValue);
      // s'assurer que les valeur du ratio sont tous différent de 0
      if (state.nairaCurrency != 0 && state.fcfaCurrency != 0) {
        // Calcule du ratio nairaCurrency / fcfaCurrency
        double ratio = state.nairaCurrency / state.fcfaCurrency;
        // Sens de la conversion

        if (state.drop == ConvertorConst.naira) {
          // Conversion en Franc cfa
          // calcul et emission du résultat
          emit(state.copyWith(
              value: value * (1 / ratio), status: HomeStatus.success));
        } else {
          // Conversion en Naira
          emit(
              state.copyWith(value: value * ratio, status: HomeStatus.success));
        }
      }
    } catch (e) {
      print(":::Error $e");
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  // void _secondConvertor(
  //     HomeSecondConvertorInputEvent event, Emitter<HomeState> emit) {}

  void _dropChange(HomeDropChangeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(drop: event.value));
  }
}
