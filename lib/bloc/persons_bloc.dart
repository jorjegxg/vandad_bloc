import 'package:bloc/bloc.dart';
import 'package:vandad_bloc/api/api_funct.dart';
import 'package:vandad_bloc/bloc/events.dart';
import 'package:vandad_bloc/bloc/states.dart';
import 'package:vandad_bloc/enums.dart';
import 'package:vandad_bloc/extensions.dart';
import 'package:vandad_bloc/models/person.dart';

class PersonsBloc extends Bloc<LoadPersonsAction, FetchResult?> {
  final Map<PersonUrl, Iterable<Person>> _cache = {};

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
          final persons = await getPersons(
            url.urlString(),
          );
          //add to cache
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
