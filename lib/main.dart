import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vandad_bloc/bloc/persons_bloc.dart';
import 'package:vandad_bloc/presentation/home_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => PersonsBloc(),
    child: MyApp(),
  ));
}

class MyApp extends MaterialApp {
  MyApp({super.key})
      : super(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        );
}
