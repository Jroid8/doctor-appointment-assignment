import 'package:doctor_appointment/features/medical/models/doctor.dart';
import 'package:doctor_appointment/features/medical/pages/doctor_details.dart';
import 'package:doctor_appointment/features/medical/repos/reviews.dart';
import 'package:doctor_appointment/features/medical/services/bookings_mgr.dart';
import 'package:doctor_appointment/features/medical/widget/remove_from_favorites.dart';
import 'package:doctor_appointment/utils/format_number.dart';
import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DoctorCard extends StatelessWidget {
  final Doctor model;
  final BookingsManager? bookingsMgr;
  final void Function(Doctor, bool)? setFavStatus;

  const DoctorCard({
    required this.model,
    this.bookingsMgr,
    this.setFavStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .all(.circular(12)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 6,
            color: Color(0x0D000000),
          ),
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
            color: Color(0x19000000),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          if (setFavStatus == null) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DoctorDetailsPage(
                model: model,
                reviewsRepo: MockReviewsRepo(),
                setFavStatus: setFavStatus!,
								bookingsMgr: bookingsMgr!,
              ),
            ),
          );
        },
        child: Row(
          children: [
            SizedBox(
              height: 109,
              width: 109,
              child: model.picture == null
                  ? null
                  : ClipRRect(
                      borderRadius: .all(.circular(12)),
                      child: Image.memory(model.picture!),
                    ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _InfoSec(model: model, setFavStatus: setFavStatus),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSec extends StatelessWidget {
  final void Function(Doctor, bool)? setFavStatus;

  const _InfoSec({required this.model, this.setFavStatus});

  final Doctor model;

  @override
  Widget build(BuildContext context) {
    return gappedWidgetStack(
      gap: 4,
      orientation: .vertical,
      crossAxisAlignment: .start,
      children: [
        _InfoSecHeader(
          model: model,
          setFavStatus: setFavStatus,
          isFavorite: model.isFavorite.obs,
        ),
        Divider(color: Colors.grey.shade200, height: 8),
        Text(
          model.specialty.name.capitalizeFirst!,
          style: TextTheme.of(context).labelMedium,
        ),
        DoctorCardAddress(model: model),
        Row(
          children: [
            SvgPicture.asset("assets/images/star.svg"),
            SizedBox(width: 4),
            Text(
              round(model.rating, decimals: 1).toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: .w400,
                color: Color(0xFF6B7280),
              ),
            ),
            VerticalDivider(
              indent: 2.5,
              endIndent: 2.5,
              width: 16,
              color: Colors.grey.shade200,
            ),
            Text("${formatNumber(model.reviewCount)} Reviews"),
          ],
        ),
      ],
    );
  }
}

class DoctorCardAddress extends StatelessWidget {
	final int? maxChars;

  const DoctorCardAddress({required this.model, this.maxChars, super.key});

  final Doctor model;

  @override
  Widget build(BuildContext context) {
		String address = model.address;
		if (address.length > 24) {
			address = "${address.substring(0, 21)}...";
		}
    return Row(
      children: [
        SvgPicture.asset("assets/images/map-pin-small.svg"),
        SizedBox(width: 4),
        Text(
          address,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: .w400,
          ),
        ),
      ],
    );
  }
}

class _InfoSecHeader extends StatelessWidget {
  final Doctor model;
  final void Function(Doctor, bool)? setFavStatus;
  final RxBool isFavorite;

  const _InfoSecHeader({
    required this.model,
    this.setFavStatus,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(model.name, style: TextTheme.of(context).titleLarge),
        Spacer(),
        GestureDetector(
          onTap: () async {
            if (setFavStatus == null) return;
            if (isFavorite.value) {
              bool? answer = await showModalBottomSheet<bool>(
                context: context,
                builder: (_) => RemoveFromFavorites(model: model),
              );
              if (answer == null || !answer) {
                return;
              }
            }
            isFavorite.value = !isFavorite.value;
            setFavStatus!(model, isFavorite.value);
          },
          child: Obx(
            () => isFavorite.value
                ? SvgPicture.asset("assets/images/heart-filled.svg")
                : SvgPicture.asset("assets/images/heart.svg"),
          ),
        ),
      ],
    );
  }
}
