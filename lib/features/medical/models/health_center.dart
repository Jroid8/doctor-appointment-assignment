import 'dart:typed_data';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/location/models/tile.dart';
import 'package:latlong2/latlong.dart';

enum HealthCenterType {
  hospital,
  clinic;

  bool toRepr() {
    if (this == .hospital) {
      return true;
    } else {
      return false;
    }
  }

  factory HealthCenterType.fromRepr(bool repr) {
    if (repr) {
      return HealthCenterType.hospital;
    } else {
      return HealthCenterType.clinic;
    }
  }

  @override
  String toString() {
    if (this == .hospital) {
      return "Hospital";
    } else {
      return "Clinic";
    }
  }
}

class HealthCenter {
  final int id;
  final String name;
  final String address;
  final double rating;
  final int reviewCount;
  final LatLng location;
  final HealthCenterType type;
  final bool isFavorite;
  final MapTile tile;
  final Uint8List? picture;

  const HealthCenter({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.location,
    required this.type,
    required this.isFavorite,
    required this.tile,
    this.picture,
  });

  HealthCenter.fromJson(Map<String, dynamic> json, this.picture)
    : id = json["id"],
      name = json["name"],
      address = json["address"],
      rating = json["rating"],
      reviewCount = json["reviewCount"],
      location = LatLng.fromJson(json),
      type = HealthCenterType.fromRepr(json["isHospital"]),
      isFavorite = json["isFavorite"],
      tile = MapTile.fromJson(json["tile"]);

  HealthCenter.fromLocalTable(HealthCenterTblData data)
    : id = data.id,
      name = data.name,
      address = data.address,
      rating = data.rating,
      reviewCount = data.reviewCount,
      location = LatLng(data.latitude, data.longitude),
      type = HealthCenterType.fromRepr(data.isHospital),
      isFavorite = data.isFavorite,
      picture = data.picture,
      tile = MapTile(data.tileX, data.tileY);

  HealthCenterTblData toLocalTable() => HealthCenterTblData(
    id: id,
    name: name,
    address: address,
    rating: rating,
    reviewCount: reviewCount,
    latitude: location.latitude,
    longitude: location.longitude,
    isHospital: type.toRepr(),
    picture: picture,
    isFavorite: isFavorite,
    tileX: tile.x,
    tileY: tile.y,
  );

  HealthCenter copyWith({
    int? id,
    String? name,
    String? address,
    double? rating,
    int? reviewCount,
    LatLng? location,
    HealthCenterType? type,
    bool? isFavorite,
    Uint8List? picture,
    MapTile? tile,
  }) {
    return HealthCenter(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      location: location ?? this.location,
      type: type ?? this.type,
      isFavorite: isFavorite ?? this.isFavorite,
      picture: picture ?? this.picture,
      tile: tile ?? this.tile,
    );
  }
}
