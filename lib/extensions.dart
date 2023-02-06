import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'dart:io';

import 'bloc/person.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

Future<Iterable<Person>> getPersons(String url) {
  return HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((resp) => resp.transform(utf8.decoder).join())
      .then((str) => json.decode(str) as List<dynamic>)
      .then((list) => list.map((e) => Person.fromJson(e)));
}

extension Subscript<T> on Iterable<T> {
  T? operator [](
    int index,
  ) =>
      length > index ? elementAt(index) : null;
}
