import 'package:flutter_test/flutter_test.dart';
import 'package:vandad_bloc/bloc/person.dart';
import 'package:vandad_bloc/bloc/persons_bloc.dart';

const mockedPersons1 = [
  Person(name: 'Foo', age: 20),
  Person(name: 'Bar', age: 30),
];

const mockedPersons2 = [
  Person(name: 'Foo', age: 20),
  Person(name: 'Bar', age: 30),
];

Future<Iterable<Person>> mockGetPerson1(
  String _,
) {
  return Future.value(mockedPersons1);
}

Future<Iterable<Person>> mockGetPerson2(
  String _,
) {
  return Future.value(mockedPersons2);
}

void main() {
  group('Test bloc', () {
    late PersonsBloc bloc;

    setUp(() => bloc = PersonsBloc());

    
  });
}
