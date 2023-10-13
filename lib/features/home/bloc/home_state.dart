// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    required this.nairaCurrency,
    required this.fcfaCurrency,
    this.inputConvertor = 0,
    this.value = 0,
    this.drop = ConvertorConst.fcfa,
    required this.status,
  });

  final double nairaCurrency;
  final double fcfaCurrency;
  final double inputConvertor;
  final double value;
  final String drop;
  final HomeStatus status;

  HomeState copyWith({
    HomeStatus? status,
    double? nairaCurrency,
    double? fcfaCurrency,
    double? inputConvertor,
    double? value,
    String? drop,
  }) {
    return HomeState(
      status: status ?? this.status,
      nairaCurrency: nairaCurrency ?? this.nairaCurrency,
      fcfaCurrency: fcfaCurrency ?? this.fcfaCurrency,
      inputConvertor: inputConvertor ?? this.inputConvertor,
      value: value ?? this.value,
      drop: drop ?? this.drop,
    );
  }

  @override
  List<Object> get props =>
      [nairaCurrency, fcfaCurrency, inputConvertor, value, drop, status];
}
