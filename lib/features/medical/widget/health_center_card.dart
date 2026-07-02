import 'package:doctor_appointment/common/widgets/rating_stars.dart';
import 'package:doctor_appointment/features/location/repos/map_distance.dart';
import 'package:doctor_appointment/features/medical/models/health_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

class HealthCenterCard extends StatelessWidget {
  final MapDistanceCalculator mdc;
  final HealthCenter model;
  final void Function(HealthCenter, bool) setFavStatus;

  const HealthCenterCard({
    required this.mdc,
    required this.model,
    required this.setFavStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(.circular(8)),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 121,
                child: model.picture == null
                    ? null
                    : Image.memory(model.picture!),
              ),
              _HCInfo(model: model, mdc: mdc),
            ],
          ),
          _FavBtn(
            model: model,
            isFavorite: model.isFavorite.obs,
            setFavStatus: setFavStatus,
          ),
        ],
      ),
    );
  }
}

class _FavBtn extends StatelessWidget {
  final HealthCenter model;
  final RxBool isFavorite;
  final void Function(HealthCenter, bool) setFavStatus;

  const _FavBtn({
    required this.model,
    required this.isFavorite,
    required this.setFavStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      top: 8,
      child: GestureDetector(
        onTap: () {
          isFavorite.value = !isFavorite.value;
          setFavStatus(model, isFavorite.value);
        },
        child: Obx(
          () => isFavorite.value
              ? SvgPicture.asset("assets/images/favorite-btn-marked.svg")
              : SvgPicture.asset("assets/images/favorite-btn.svg"),
        ),
      ),
    );
  }
}

class _HCInfo extends StatelessWidget {
  final MapDistanceCalculator mdc;

  const _HCInfo({required this.model, required this.mdc});

  final HealthCenter model;

  @override
  Widget build(BuildContext context) {
    (double, Duration) distance = mdc.getDistance(model.location);
    return Padding(
      padding: .symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            model.name,
            style: TextTheme.of(context).titleMedium!.copyWith(fontSize: 14),
          ),
          SizedBox(height: 8),
          _Address(model: model),
          SizedBox(height: 4),
          Row(
            children: [
              Expanded(child: RatingStars(model.rating)),
              SizedBox(width: 8),
              Text(
                "(${model.reviewCount} Reviews)",
                style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 12),
              ),
            ],
          ),
          Divider(color: Color(0xffE5E7EB), height: 24),
          _BottomInfo(distance: distance, model: model),
        ],
      ),
    );
  }
}

class _BottomInfo extends StatelessWidget {
  const _BottomInfo({required this.distance, required this.model});

  final (double, Duration) distance;
  final HealthCenter model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/images/routing.svg"),
        SizedBox(width: 4),
        Text(
          "${distance.$1} km/${distance.$2.inMinutes}min",
          style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 12),
        ),
        Spacer(),
        SvgPicture.asset("assets/images/hospital.svg"),
        SizedBox(width: 4),
        Text(
          model.type.toString(),
          style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}

// class _Rating extends StatelessWidget {
//   const _Rating({required this.model, required this.starsRow});
//
//   final HealthCenter model;
//   final List<Widget> starsRow;
//
//   @override
//   Widget build(BuildContext context) {
//
// 	}
// }

class _Address extends StatelessWidget {
  const _Address({required this.model});

  final HealthCenter model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/map-pin-small.svg",
          width: 14,
          height: 14,
        ),
        SizedBox(width: 4),
        Text(
          model.address,
          style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
