import 'package:ellipsized_text/src/ellipsized_text_render_object.dart';
import 'package:ellipsized_text/ellipsized_text.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui show TextHeightBehavior;

/// Main package class.\
/// ✏️ One line ellipsized text with the ability to adjust the position of the ellipsis.
class EllipsizedText extends LeafRenderObjectWidget {
  /// [text] Text that will shrink into three dots when it reaches a larger size.
  /// [type] Type of ellipsis text position.
  /// [ellipsis] Text of ellipsis.
  /// [style] Text style.
  /// [strutStyle] Strut style.
  /// [textAlign] Text align.
  /// [textDirection] Text direction.
  /// [locale] Locale.
  /// [textScaleFactor] Text scale factor.
  /// [textWidthBasis] Text width basis.
  /// [textHeightBehavior] Text height behavior.
  const EllipsizedText(
    this.text, {
    super.key,
    this.type = EllipsisType.end,
    this.ellipsis = "...",
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.textScaleFactor,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  /// Text that will shrink into three dots when it reaches a larger size.
  final String text;

  /// Type of ellipsis text position.
  final EllipsisType type;

  /// Text of ellipsis.
  final String ellipsis;

  /// Text style.
  final TextStyle? style;

  /// Strut style.
  final StrutStyle? strutStyle;

  /// Text align.
  final TextAlign? textAlign;

  /// Text direction.
  final TextDirection? textDirection;

  /// Locale.
  final Locale? locale;

  /// Text scale factor.
  final double? textScaleFactor;

  /// Text width basis.
  final TextWidthBasis? textWidthBasis;

  /// Text height behavior.
  final ui.TextHeightBehavior? textHeightBehavior;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      EllipsizedTextRenderObject()
        ..render(
          context,
          this,
        );

  @override
  void updateRenderObject(
    BuildContext context,
    EllipsizedTextRenderObject renderObject,
  ) =>
      renderObject.render(
        context,
        this,
      );
}
