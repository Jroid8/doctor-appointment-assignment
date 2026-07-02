import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    double r = round(rating, decimals: 1);
    int wholeStars = rating.floor();
    List<Widget> starsRow = List.generate(
      wholeStars,
      (_) => SvgPicture.asset("assets/images/star.svg"),
    );
    if (rating - wholeStars > 0.5) {
      starsRow.add(SvgPicture.asset("assets/images/half-star.svg"));
    }
    while (starsRow.length < 5) {
      starsRow.add(SvgPicture.asset("assets/images/hollow-star.svg"));
    }

    return Row(
      children: [
        Text(
          r.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            fontWeight: .w600,
            color: Color(0xFF6B7280),
          ),
        ),
        SizedBox(width: 4),
        gappedWidgetStack(gap: 2, orientation: .horizontal, children: starsRow),
      ],
    );
  }
}
