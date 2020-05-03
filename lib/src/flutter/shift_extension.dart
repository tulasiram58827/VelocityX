import 'package:flutter/material.dart';

///  Use it to pin and shift widget usefult for making complex ui Eg
/// Container(
///   height: 200,
///   width: 200,
///   decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffE0D8F9)
///       ),
/// ).shift(100, alignment: Alignment.bottomRight) , 
extension ShiftWidgetExt on Widget {
  Widget shift(
    double shift, {
    Key key,
    @required Alignment alignment,
  }) =>
      WidgetShifter(
        key: key,
        child: this,
        alignment: alignment,
        shift: shift,
      );
}


class WidgetShifter extends StatelessWidget {
  const WidgetShifter({
    Key key,

    // @required this.w,
    // this.color,
    this.child,
    @required this.alignment,
    @required this.shift,

    // @required this.paddingPerc,
  }) : super(key: key);

  final double shift;
  // final Color color;
  final Widget child;
  final Alignment alignment;
  // final int paddingPerc;

  @override
  Widget build(BuildContext context) {
    double x, y;
    if (alignment == Alignment.topRight) {
      x = shift;
      y = -shift;
    } else if (alignment == Alignment.topLeft) {
      x = -shift;
      y = -shift;
    } else if (alignment == Alignment.bottomRight) {
      x = shift;
      y = shift;
    } else if (alignment == Alignment.bottomLeft) {
      x = -shift;
      y = shift;
    } else {
      throw UnsupportedError('Not supported alignment $alignment');
    }

    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: Offset(x, y),
        child: child,
      ),
    );
  }
}