import 'package:doctor_appointment/features/medical/models/doctor.dart';
import 'package:doctor_appointment/features/medical/widget/doctor_card.dart';
import 'package:flutter/material.dart';

class RemoveFromFavorites extends StatelessWidget {
  final Doctor model;

  const RemoveFromFavorites({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        height: 260,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text(
              "Remove from Favorites?",
              style: TextStyle(
                color: ColorScheme.of(context).primary,
                fontWeight: .w600,
                fontSize: 20,
              ),
            ),
            Divider(height: 32, color: Color(0xFFE5E7EB)),
            DoctorCard(model: model),
            SizedBox(height: 24),
            _Buttons(),
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 163,
          height: 41,
          child: FilledButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: ColorScheme.of(context).primary,
            ),
            child: const Text("Cancel"),
          ),
        ),
        SizedBox(width: 16),
        SizedBox(
          width: 163,
          height: 41,
          child: FilledButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text("Yes, Remove"),
          ),
        ),
      ],
    );
  }
}
