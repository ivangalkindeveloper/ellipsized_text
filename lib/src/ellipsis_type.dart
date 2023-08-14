import 'package:collection/collection.dart';

// Ellipsis types
enum EllipsisType {
  start,
  middle,
  end;

  static EllipsisType fromString(
    String value,
  ) {
    final EllipsisType? result = EllipsisType.values.firstWhereOrNull(
      (EllipsisType element) => element.name == value,
    );

    if (result == null) {
      throw ArgumentError("Unknown Environment: $value");
    }

    return result;
  }
}
