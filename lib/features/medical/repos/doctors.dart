import 'dart:typed_data';
import 'package:doctor_appointment/common/models/time.dart';
import 'package:doctor_appointment/common/models/weekday.dart';
import 'package:doctor_appointment/features/location/models/tile.dart';
import 'package:doctor_appointment/features/medical/models/doctor.dart';
import 'package:doctor_appointment/features/medical/models/working_time.dart';
import 'package:doctor_appointment/features/medical/repos/doctor_images.dart';
import 'package:latlong2/latlong.dart';

abstract class DoctorsRepo {
  Future<List<Doctor>> fetch(MapTile tile);
  Future<Doctor> find(int id);
}

class MockDoctorsRepo implements DoctorsRepo {
  static List<Doctor> mockedDoctors = [
    Doctor(
      id: 1,
      name: "David Patel",
      specialty: .cardiology,
      address: "Cardiology Center, USA",
      rating: 5,
      reviewCount: 1872,
      tile: MapTile(0, 0),
      location: LatLng(0, 0),
      isFavorite: false,
      patientsCount: 2000,
      yearsOfExperience: 10,
      bio:
          "Dr. David Patel, a dedicated cardiologist, brings a wealth of experience to Golden Gate Cardiology Center in Golden Gate, CA.",
      workingTime: WorkingTime(
        officeHours: TimeWindows(
          Time(hour: 6, minute: 0),
          Time(hour: 14, minute: 0),
          20,
        ),
        startDay: Weekday.monday,
        endDay: Weekday.saturday,
      ),
    ),
    Doctor(
      id: 2,
      name: "Jessica Turner",
      specialty: .general,
      address: "Women's Clinic,Seatle,USA",
      rating: 4.9,
      reviewCount: 127,
      tile: MapTile(0, 0),
      location: LatLng(0, 0),
      isFavorite: false,
      patientsCount: 1000,
      yearsOfExperience: 6,
      bio: "Dr. Jessica Turner, a dedicated doctor",
      workingTime: WorkingTime(
        officeHours: TimeWindows(
          Time(hour: 8, minute: 0),
          Time(hour: 17, minute: 40),
          20,
        ),
        startDay: Weekday.monday,
        endDay: Weekday.saturday,
      ),
    ),
    Doctor(
      id: 3,
      name: "Michael Johnson",
      specialty: .pulmonology,
      address: "Maple Associates, NY,USA",
      rating: 4.7,
      reviewCount: 5223,
      tile: MapTile(0, 0),
      location: LatLng(0, 0),
      isFavorite: false,
      patientsCount: 6000,
      yearsOfExperience: 20,
      bio: "",
      workingTime: WorkingTime(
        officeHours: TimeWindows(
          Time(hour: 12, minute: 0),
          Time(hour: 21, minute: 0),
          20,
        ),
        startDay: Weekday.monday,
        endDay: Weekday.saturday,
      ),
    ),
    Doctor(
      id: 4,
      name: "Emily Walker",
      specialty: .neurology,
      address: "Serenity Pediatrics Clinic",
      rating: 5,
      reviewCount: 405,
      tile: MapTile(0, 0),
      location: LatLng(0, 0),
      isFavorite: true,
      patientsCount: 3000,
      yearsOfExperience: 14,
      bio: "",
      workingTime: WorkingTime(
        officeHours: TimeWindows(
          Time(hour: 8, minute: 0),
          Time(hour: 18, minute: 0),
          40,
        ),
        startDay: Weekday.monday,
        endDay: Weekday.saturday,
      ),
    ),
  ];

  static bool picturesInserted = false;

  Future<void> _insertPictures() async {
    if (!picturesInserted) {
      for (int i = 0; i < mockedDoctors.length; i++) {
        Doctor d = mockedDoctors[i];
        Uint8List? imageData = await MockDoctorImagesRepo().getForId(d.id);
        if (imageData != null) {
          mockedDoctors[i] = d.copyWith(
            picture: Uint8List.sublistView(imageData),
          );
        }
      }
      picturesInserted = true;
    }
  }

  @override
  Future<List<Doctor>> fetch(MapTile tile) async {
    await _insertPictures();
    return mockedDoctors;
  }

  @override
  Future<Doctor> find(int id) async {
    await _insertPictures();
    return mockedDoctors.where((doc) => doc.id == id).first;
  }
}
