import 'constants.dart';

extension NonNullableString on String? {
  String orEmpty() {
    //return empty if null
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullableInt on int? {
  int orZero() {
    //return zero if null
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}
