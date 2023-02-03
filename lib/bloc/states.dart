import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vandad_bloc/models/person.dart';

@immutable
class FetchResult extends Equatable {
  final Iterable<Person> persons;
  final bool isRetrievedFromChache;

  const FetchResult({
    required this.persons,
    required this.isRetrievedFromChache,
  });

  @override
  String toString() {
    return 'FetchResult(isRetrievedFromChache : $isRetrievedFromChache, persons : $persons)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [persons, isRetrievedFromChache];
}
