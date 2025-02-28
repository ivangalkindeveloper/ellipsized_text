// Ellipsis types
enum EllipsisType {
  start,
  middle,
  end;

  static EllipsisType? fromString(
    String value,
  ) =>
      switch (value) {
        'start' => EllipsisType.start,
        'middle' => EllipsisType.middle,
        'end' => EllipsisType.end,
        _ => null,
      };
}
