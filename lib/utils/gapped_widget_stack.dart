import 'package:flutter/widgets.dart';

Widget gappedWidgetStack({
  required double gap,
  required Axis orientation,
  required List<Widget> children,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
}) {
  SizedBox gapWidget = orientation == Axis.horizontal
      ? SizedBox(width: gap, height: 0)
      : SizedBox(height: gap, width: 0);
  for (int i = children.length - 1; i > 0; i--) {
    children.insert(i, gapWidget);
  }
  if (orientation == Axis.horizontal) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );
  } else {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );
  }
}
