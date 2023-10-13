import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naira_convertor/features/cubit/app_theme_cubit.dart';
import 'package:naira_convertor/features/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state
                ? dark
                : ThemeData(
                    fontFamily: 'Schyler',
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: Colors.deepPurple,
                        secondary: Colors.deepPurple),
                    useMaterial3: true,
                  ),
            home: const Splash(),
          );
        },
      ),
    );
  }
}

ThemeData dark = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Schyler'),
    primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Schyler'),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black87, secondary: Colors.black87));
