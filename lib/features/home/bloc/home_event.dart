// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitEvent extends HomeEvent {}

class HomeNairaCurrencyInputEvent extends HomeEvent {
  String nairaCurrency;
  HomeNairaCurrencyInputEvent({
    required this.nairaCurrency,
  });
}

class HomeFcfaCurrencyInputEvent extends HomeEvent {
  String fcfaCurrency;
  HomeFcfaCurrencyInputEvent({
    required this.fcfaCurrency,
  });
}

class HomeConvertorInputEvent extends HomeEvent {
  String inputFirstConvertorValue;
  HomeConvertorInputEvent({
    required this.inputFirstConvertorValue,
  });
}



class HomeDropChangeEvent extends HomeEvent {
  String? value;
  HomeDropChangeEvent({
    required this.value,
  });
}
