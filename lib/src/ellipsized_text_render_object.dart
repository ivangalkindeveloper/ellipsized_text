import 'package:ellipsized_text/src/ellipsized_text.dart';
import 'package:ellipsized_text/src/ellipsis_type.dart';
import 'package:flutter/material.dart';

class EllipsizedTextRenderObject extends RenderBox {
  TextPainter _textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );
  BoxConstraints _constraints = const BoxConstraints();
  EllipsizedText _widget = const EllipsizedText("");
  bool _widgetChanged = false;

  void render(
    BuildContext context,
    EllipsizedText widget,
  ) {
    if (this._widget.text == widget.text &&
        this._widget.type == widget.type &&
        this._widget.ellipsis == widget.ellipsis &&
        this._widget.style == widget.style &&
        this._widget.align == widget.align &&
        this._widget.direction == widget.direction) {
      return;
    }

    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final TextDirection textDirection = Directionality.of(context);

    this._textPainter = TextPainter(
      textDirection: widget.direction ?? textDirection,
    );
    this._widget = EllipsizedText(
      widget.text,
      key: widget.key,
      type: widget.type,
      ellipsis: widget.ellipsis,
      style: defaultTextStyle.style.copyWith(
        inherit: widget.style?.inherit,
        color: widget.style?.color,
        backgroundColor: widget.style?.backgroundColor,
        fontSize: widget.style?.fontSize,
        fontWeight: widget.style?.fontWeight,
        fontStyle: widget.style?.fontStyle,
        letterSpacing: widget.style?.letterSpacing,
        wordSpacing: widget.style?.wordSpacing,
        textBaseline: widget.style?.textBaseline,
        height: widget.style?.height,
        leadingDistribution: widget.style?.leadingDistribution,
        locale: widget.style?.locale,
        foreground: widget.style?.foreground,
        background: widget.style?.background,
        shadows: widget.style?.shadows,
        fontFeatures: widget.style?.fontFeatures,
        fontVariations: widget.style?.fontVariations,
        decoration: widget.style?.decoration,
        decorationColor: widget.style?.decorationColor,
        decorationStyle: widget.style?.decorationStyle,
        decorationThickness: widget.style?.decorationThickness,
        debugLabel: widget.style?.debugLabel,
        fontFamily: widget.style?.fontFamily,
        fontFamilyFallback: widget.style?.fontFamilyFallback,
        overflow: widget.style?.overflow,
      ),
      align: (widget.align ?? defaultTextStyle.textAlign) ?? TextAlign.start,
      direction: widget.direction ?? textDirection,
    );
    this._widgetChanged = true;
    super.markNeedsLayout();
  }

  double _layoutText({
    required int length,
    required double minWidth,
  }) {
    final String text = this._widget.text;
    final EllipsisType type = this._widget.type;
    final String ellipsis = this._widget.ellipsis;
    final TextStyle style = this._widget.style!;
    final TextAlign align = this._widget.align!;

    String ellipsizedText = "";

    switch (type) {
      case EllipsisType.start:
        if (length > 0) {
          ellipsizedText = text.substring(
            text.length - length,
            text.length,
          );
          if (length != text.length) {
            ellipsizedText = "$ellipsis$ellipsizedText";
          }
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
          if (length != text.length) {
            ellipsizedText = "$ellipsizedText$ellipsis";
          }
        }
        break;
    }

    this._textPainter.text = TextSpan(
      text: ellipsizedText,
      style: style,
      locale: style.locale,
    );
    this._textPainter.textAlign = align;
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

    if (this._layoutText(
          length: text.length,
          minWidth: minWidth,
        ) >
        maxWidth) {
      int left = 0;
      int right = text.length - 1;

      while (left < right) {
        final int index = (left + right) ~/ 2;
        if (this._layoutText(
              length: index,
              minWidth: minWidth,
            ) >
            maxWidth) {
          right = index;
        } else {
          left = index + 1;
        }
      }
      this._layoutText(
        length: right - 1,
        minWidth: minWidth,
      );
    }

    final Size size = Size(
      this._textPainter.width,
      this._textPainter.height,
    );

    return this.constraints.constrain(size);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset,
  ) =>
      this._textPainter.paint(
            context.canvas,
            offset,
          );

  @override
  void performLayout() {
    if (this._widgetChanged == false &&
        this._constraints == this.constraints &&
        this.hasSize) {
      return;
    }

    this._widgetChanged = false;
    this._constraints = this.constraints;

    this.size = this._ellipsize(
      minWidth: this.constraints.minWidth,
      maxWidth: this.constraints.maxWidth,
    );
  }
}
