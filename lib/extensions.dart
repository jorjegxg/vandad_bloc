import 'dart:developer' as devtools show log;

import 'enums.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

extension UrlString on PersonUrl {
  String urlString() {
    switch (this) {
      case PersonUrl.persons1:
        return 'http://127.0.0.1:5500/api/persons1.json';
      case PersonUrl.persons2:
        return 'http://127.0.0.1:5500/api/persons2.json';
    }
  }
}

extension Subscript<T> on Iterable<T> {
  T? operator [](
    int index,
  ) =>
      length > index ? elementAt(index) : null;
}
