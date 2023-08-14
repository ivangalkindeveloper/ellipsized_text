import 'package:ellipsized_text/src/ellipsized_text_render_object.dart';
import 'package:ellipsized_text/ellipsized_text.dart';
import 'package:flutter/material.dart';

/// Main package class.\
/// ✏️ One line ellipsized text with the ability to adjust the position of the ellipsis.
class EllipsizedText extends LeafRenderObjectWidget {
  /// [text] Text that will shrink into three dots when it reaches a larger size.\
  /// [type] Type of ellipsis text position.\
  /// [ellipsis] Text of ellipsis.\
  /// [style] Text style.\
  /// [align] Text align.
  /// [direction] Text direction.
  const EllipsizedText(
    this.text, {
    Key? key,
    this.type = EllipsisType.end,
    this.ellipsis = "...",
    this.style,
    this.align,
    this.direction,
  }) : super(key: key);

  /// Text that will shrink into three dots when it reaches a larger size.
  final String text;

  /// Type of ellipsis text position.
  final EllipsisType type;

  /// Text of ellipsis.
  final String ellipsis;

  /// Text style.
  final TextStyle? style;

  /// Text align.
  final TextAlign? align;

  /// Text direction.
  final TextDirection? direction;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      EllipsizedTextRenderObject()
        ..widget(
          context,
          this,
        );

  @override
  void updateRenderObject(
    BuildContext context,
    EllipsizedTextRenderObject renderObject,
  ) =>
      renderObject.widget(
        context,
        this,
      );
}
