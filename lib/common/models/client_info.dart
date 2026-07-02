import 'dart:typed_data';

import 'package:doctor_appointment/common/repos/localdb.dart';

enum Gender { male, female, other }

class ClientInfo {
  final int id;
  final String name;
  final String? nickname;
  final Gender? gender;
  final String email;
  final String? phoneNumber;
  final Uint8List? picture;

  const ClientInfo({
    required this.id,
    required this.name,
    required this.email,
    this.gender,
    this.phoneNumber,
    this.nickname,
    this.picture,
  });

  ClientInfo.fromLocalTable(ClientSessionTblData data)
    : id = data.id,
      name = data.name,
      email = data.email,
      nickname = data.nickname,
      gender = data.gender == null ? null : Gender.values[data.gender!],
      phoneNumber = data.phoneNumber,
      picture = data.picture;

  ClientInfo.fromJson(Map<String, dynamic> json, this.picture)
    : id = json["id"],
      name = json["name"],
      nickname = json["nickname"],
      email = json["email"],
      gender = json["gender"] == null ? null : Gender.values[json["gender"]],
      phoneNumber = json["phoneNumber"];
}
