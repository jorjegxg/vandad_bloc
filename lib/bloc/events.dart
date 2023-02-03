import 'package:flutter/material.dart';
import 'package:vandad_bloc/enums.dart';
import 'package:vandad_bloc/main.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}


@immutable
class LoadPersonsAction implements LoadAction {
  final PersonUrl url;

  const LoadPersonsAction({required this.url}) : super();
}

