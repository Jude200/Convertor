// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

class AppThemeCubit extends Cubit<bool> {
  AppThemeCubit() : super(false);

  void change() => emit(!state);
}
