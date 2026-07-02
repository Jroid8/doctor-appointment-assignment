import 'dart:typed_data';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/location/models/tile.dart';
import 'package:doctor_appointment/features/medical/models/working_time.dart';
import 'package:doctor_appointment/features/medical/models/specialty.dart';
import 'package:latlong2/latlong.dart';

class Doctor {
  final int id;
  final String name;
  final String address;
  final double rating;
  final int reviewCount;
  final LatLng location;
  final bool isFavorite;
  final MapTile tile;
  final Specialty specialty;
  final Uint8List? picture;
  final int patientsCount;
  final int yearsOfExperience;
  final String bio;
  final WorkingTime workingTime;

  const Doctor({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.location,
    required this.isFavorite,
    required this.specialty,
    required this.tile,
    required this.patientsCount,
    required this.yearsOfExperience,
    required this.bio,
    required this.workingTime,
    this.picture,
  });

  Doctor.fromJson(Map<String, dynamic> json, this.picture)
    : id = json["id"],
      name = json["name"],
      address = json["address"],
      rating = json["rating"],
      reviewCount = json["reviewCount"],
      location = LatLng.fromJson(json),
      isFavorite = json["isFavorite"],
      tile = MapTile.fromJson(json["tile"]),
      specialty = Specialty.values[json["specialty"]],
      patientsCount = json["patientsCount"],
      yearsOfExperience = json["yearsOfExperience"],
      bio = json["bio"],
      workingTime = WorkingTime.fromJson(json["workTime"]);

  Doctor.fromLocalTable(DoctorTblData data)
    : id = data.id,
      name = data.name,
      address = data.address,
      rating = data.rating,
      reviewCount = data.reviewCount,
      location = LatLng(data.latitude, data.longitude),
      isFavorite = data.isFavorite,
      picture = data.picture,
      tile = MapTile(data.tileX, data.tileY),
      specialty = Specialty.values[data.specialty],
      patientsCount = data.patientsCount,
      yearsOfExperience = data.yearsOfExperience,
      bio = data.bio,
      workingTime = WorkingTime.fromLocalTable(data);

  DoctorTblData toLocalTable() => DoctorTblData(
    id: id,
    name: name,
    address: address,
    rating: rating,
    reviewCount: reviewCount,
    latitude: location.latitude,
    longitude: location.longitude,
    picture: picture,
    isFavorite: isFavorite,
    tileX: tile.x,
    tileY: tile.y,
    specialty: specialty.index,
    patientsCount: patientsCount,
    yearsOfExperience: yearsOfExperience,
    bio: bio,
    dayStartMin: workingTime.officeHours.start.totalMinutes,
    dayEndMin: workingTime.officeHours.end.totalMinutes,
    visitDuration: workingTime.officeHours.visitMinutes,
    startDay: workingTime.startDay.index,
    endDay: workingTime.endDay.index,
  );

  Doctor copyWith({
    int? id,
    String? name,
    String? address,
    double? rating,
    int? reviewCount,
    LatLng? location,
    bool? isFavorite,
    Uint8List? picture,
    MapTile? tile,
    Specialty? specialty,
    int? patientsCount,
    int? yearsOfExperience,
    String? bio,
    WorkingTime? workingTime,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      location: location ?? this.location,
      isFavorite: isFavorite ?? this.isFavorite,
      picture: picture ?? this.picture,
      tile: tile ?? this.tile,
      specialty: specialty ?? this.specialty,
      patientsCount: patientsCount ?? this.patientsCount,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      bio: bio ?? this.bio,
      workingTime: workingTime ?? this.workingTime,
    );
  }
}
