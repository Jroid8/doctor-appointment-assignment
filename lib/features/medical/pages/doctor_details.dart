import 'package:doctor_appointment/common/widgets/rating_stars.dart';
import 'package:doctor_appointment/features/medical/models/doctor.dart';
import 'package:doctor_appointment/features/medical/models/review.dart';
import 'package:doctor_appointment/features/medical/pages/book_appointment.dart';
import 'package:doctor_appointment/features/medical/repos/reviews.dart';
import 'package:doctor_appointment/features/medical/services/bookings_mgr.dart';
import 'package:doctor_appointment/features/medical/widget/doctor_card.dart';
import 'package:doctor_appointment/features/medical/widget/remove_from_favorites.dart';
import 'package:doctor_appointment/utils/format_number.dart';
import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DoctorDetailsPage extends StatefulWidget {
  final Doctor model;
  final ReviewsRepo reviewsRepo;
  final BookingsManager bookingsMgr;
  final void Function(Doctor, bool) setFavStatus;

  const DoctorDetailsPage({
    required this.model,
    required this.reviewsRepo,
    required this.setFavStatus,
    required this.bookingsMgr,
    super.key,
  });

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  late RxBool isFavorite;

  @override
  void initState() {
    isFavorite = widget.model.isFavorite.obs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final header = TextStyle(
      fontWeight: .w600,
      fontSize: 20,
      color: Color(0xFF1F2A37),
    );
    return Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 24, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              _TopBar(isFavorite: isFavorite, widget: widget),
              SizedBox(height: 16),
              _DoctorCard(model: widget.model),
              SizedBox(height: 26),
              _DoctorStats(model: widget.model),
              SizedBox(height: 16),
              Text("About me", style: header),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: widget.model.bio,
                  style: TextTheme.of(context).bodyMedium,
                  children: [
                    TextSpan(text: " "),
                    TextSpan(
                      text: "view more",
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        color: Color(0xFF111928),
                        decoration: .underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text("Working Time", style: header),
              SizedBox(height: 8),
              Text(
                widget.model.workingTime.toString(),
                style: TextTheme.of(context).bodyMedium,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text("Reviews", style: header),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: .w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              _Reviews(
                reviewsRepo: widget.reviewsRepo,
                doctorId: widget.model.id,
              ),
              SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookAppointmentPage(
                        bookingsMgr: widget.bookingsMgr,
                        doctor: widget.model,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: .all(12),
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(fontWeight: .w500, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.isFavorite, required this.widget});

  final RxBool isFavorite;
  final DoctorDetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset("assets/images/back.svg"),
        ),
        Text("Doctor Details", style: TextTheme.of(context).labelLarge),
        GestureDetector(
          onTap: () async {
            if (isFavorite.value) {
              bool? answer = await showModalBottomSheet<bool>(
                context: context,
                builder: (_) => RemoveFromFavorites(model: widget.model),
              );
              if (answer == null || !answer) {
                return;
              }
            }
            isFavorite.value = !isFavorite.value;
            widget.setFavStatus(widget.model, isFavorite.value);
          },
          child: Obx(
            () => SvgPicture.asset(
              isFavorite.value
                  ? "assets/images/heart-filled.svg"
                  : "assets/images/heart.svg",
              width: 20,
              height: 17.8,
            ),
          ),
        ),
      ],
    );
  }
}

class _DoctorCard extends StatelessWidget {
  final Doctor model;

  const _DoctorCard({required this.model});

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
          Expanded(child: _CardInfoSec(model: model)),
        ],
      ),
    );
  }
}

class _CardInfoSec extends StatelessWidget {
  const _CardInfoSec({required this.model});

  final Doctor model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(model.name, style: TextTheme.of(context).titleLarge),
        Divider(color: Colors.grey.shade200, height: 16),
        Text(
          model.specialty.name.capitalizeFirst!,
          style: TextTheme.of(context).labelMedium,
        ),
        SizedBox(height: 8),
        DoctorCardAddress(model: model),
      ],
    );
  }
}

class _DoctorStats extends StatelessWidget {
  final Doctor model;

  const _DoctorStats({required this.model});

  @override
  Widget build(BuildContext context) {
    List<(String, String, String)> stats = [
      ("patients", formatNumber(model.patientsCount), "patients"),
      ("xp", "${model.yearsOfExperience}+", "exp."),
      ("rating", round(model.rating, decimals: 1).toString(), "rating"),
      ("reviews", formatNumber(model.reviewCount), "reviews"),
    ];
    return gappedWidgetStack(
      gap: 39,
      orientation: Axis.horizontal,
      children: List.of(
        stats.map<Widget>(
          (st) => gappedWidgetStack(
            gap: 2,
            orientation: Axis.vertical,
            children: [
              SvgPicture.asset("assets/images/doc-stats-${st.$1}.svg"),
              Text(
                st.$2,
                style: TextStyle(
                  fontWeight: .w600,
                  fontSize: 14,
                  color: Color(0xFF4B5563),
                ),
              ),
              Text(
                st.$3,
                style: TextStyle(
                  fontWeight: .w400,
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Reviews extends StatefulWidget {
  final ReviewsRepo reviewsRepo;
  final int doctorId;

  const _Reviews({required this.reviewsRepo, required this.doctorId});

  @override
  State<StatefulWidget> createState() => _ReviewsState();
}

class _ReviewsState extends State<_Reviews> {
  RxList<Review> reviews = RxList();

  @override
  void initState() {
    loadReviews();
    super.initState();
  }

  Future<void> loadReviews() async {
    reviews.value = await widget.reviewsRepo.fetch(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: List.of(reviews.map<_ReviewWidget>(_ReviewWidget.new)),
      ),
    );
  }
}

class _ReviewWidget extends StatelessWidget {
  final Review model;

  const _ReviewWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(
                "assets/images/no-profile-picture.png",
              ),
              foregroundImage: model.picture == null
                  ? null
                  : MemoryImage(model.picture!),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                    color: Color(0xFF374151),
                    fontWeight: .w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                RatingStars(model.rating.toDouble() / 2),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          model.review,
          style: TextStyle(
            color: Color(0xFF6B7280),
            fontWeight: .w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
