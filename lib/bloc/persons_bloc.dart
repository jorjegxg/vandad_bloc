import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:vandad_bloc/bloc/bloc_actions.dart';
import 'package:vandad_bloc/bloc/person.dart';

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
  List<Object?> get props => [persons, isRetrievedFromChache];
}

class PersonsBloc extends Bloc<LoadPersonsAction, FetchResult?> {
  final Map<String, Iterable<Person>> _cache = {};

  PersonsBloc() : super(null) {
    on<LoadPersonsAction>(
      (event, emit) async {
        final url = event.url;

        if (_cache.containsKey(url)) {
          emit(
            FetchResult(
              persons: _cache[url]!,
              isRetrievedFromChache: true,
            ),
          );
        } else {
          final loader = event.loader;
          final persons = await loader(url);
          _cache[url] = persons;
          emit(
            FetchResult(
              persons: persons,
              isRetrievedFromChache: false,
            ),
          );
        }
      },
    );
  }
}
