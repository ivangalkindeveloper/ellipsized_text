import 'package:ellipsized_text/ellipsized_text.dart';
import 'package:flutter/material.dart';

/// Main package class.\
/// ✏️ One line ellipsized text with the ability to adjust the position of the ellipsis.
class EllipsizedText extends LeafRenderObjectWidget {
  /// [text] Text that will shrink into three dots when it reaches a larger size.\
  /// [type] Type of ellipsis text position.\
  /// [ellipsis] Text of ellipsis.\
  /// [style] Text style.\
  /// [align] Text slign.
  const EllipsizedText(
    this.text, {
    Key? key,
    this.type = EllipsisType.end,
    this.ellipsis = "...",
    this.style,
    this.align = TextAlign.start,
  }) : super(key: key);

  /// Text that will shrink into three dots when it reaches a larger size.
  final String text;

  /// Type of ellipsis text position.
  final EllipsisType type;

  /// Text of ellipsis.
  final String ellipsis;

  /// Text style.
  final TextStyle? style;

  /// Text slign.
  final TextAlign align;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      EllipsizedTextRenderObject()..widget = this;

  @override
  void updateRenderObject(
    BuildContext context,
    EllipsizedTextRenderObject renderObject,
  ) =>
      renderObject.widget = this;
}

class EllipsizedTextRenderObject extends RenderBox {
  final TextPainter _textPainter = TextPainter(textDirection: TextDirection.ltr);
  BoxConstraints _constraints = const BoxConstraints();
  EllipsizedText _widget = const EllipsizedText("");
  bool _widgetChanged = false;

  set widget(EllipsizedText widget) {
    if (this._widget.text == widget.text &&
        this._widget.type == widget.type &&
        this._widget.ellipsis == widget.ellipsis &&
        this._widget.style == widget.style &&
        this._widget.align == widget.align) return;

    this._widgetChanged = true;
    this._widget = widget;
    super.markNeedsLayout();
  }

  double _layoutText({
    required int length,
    required double minWidth,
  }) {
    final String text = this._widget.text;
    final String ellipsis = this._widget.ellipsis;
    final TextAlign? align = this._widget.align;
    final TextStyle style = TextStyle(
      fontSize: this._widget.style?.fontSize ?? 14,
      color: this._widget.style?.color ?? Colors.black,
      fontWeight: this._widget.style?.fontWeight ?? FontWeight.w400,
    );

    String ellipsizedText = "";

    switch (this._widget.type) {
      case EllipsisType.start:
        if (length > 0) {
          ellipsizedText = text.substring(
            text.length - length,
            text.length,
          );
          if (length != text.length) ellipsizedText = "$ellipsis$ellipsizedText";
        }
        break;

      case EllipsisType.middle:
        if (length > 0) {
          ellipsizedText = text;
          if (length != text.length) {
            final String startText = text.substring(
              0,
              (length / 2).round(),
            );
            final String endText = text.substring(
              text.length - startText.length,
              text.length,
            );
            ellipsizedText = "$startText$ellipsis$endText";
          }
        }
        break;

      case EllipsisType.end:
        if (length > 0) {
          ellipsizedText = text.substring(0, length);
          if (length != text.length) ellipsizedText = "$ellipsizedText$ellipsis";
        }
        break;
    }

    this._textPainter.text = TextSpan(
      text: ellipsizedText,
      style: style,
    );
    this._textPainter.textAlign = align ?? TextAlign.start;
    this._textPainter.layout(
          minWidth: minWidth,
          maxWidth: double.infinity,
        );
    return this._textPainter.width;
  }

  Size _ellipsize({
    required double minWidth,
    required double maxWidth,
  }) {
    final String text = this._widget.text;

    if (this._layoutText(length: text.length, minWidth: minWidth) > maxWidth) {
      int left = 0;
      int right = text.length - 1;

      while (left < right) {
        final int index = (left + right) ~/ 2;
        if (this._layoutText(length: index, minWidth: minWidth) > maxWidth) {
          right = index;
        } else {
          left = index + 1;
        }
      }
      this._layoutText(length: right - 1, minWidth: minWidth);
    }

    final Size size = Size(
      this._textPainter.width,
      this._textPainter.height,
    );
    return this.constraints.constrain(size);
  }

  @override
  void paint(PaintingContext context, Offset offset) => this._textPainter.paint(
        context.canvas,
        offset,
      );

  @override
  void performLayout() {
    if (!this._widgetChanged && this._constraints == this.constraints && this.hasSize)
      return;

    this._widgetChanged = false;
    this._constraints = this.constraints;

    this.size = this._ellipsize(
      minWidth: this.constraints.minWidth,
      maxWidth: this.constraints.maxWidth,
    );
  }
}
