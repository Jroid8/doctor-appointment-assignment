// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localdb.dart';

// ignore_for_file: type=lint
class $ClientSessionTblTable extends ClientSessionTbl
    with TableInfo<$ClientSessionTblTable, ClientSessionTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientSessionTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationLabelMeta = const VerificationMeta(
    'locationLabel',
  );
  @override
  late final GeneratedColumn<String> locationLabel = GeneratedColumn<String>(
    'location_label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pictureMeta = const VerificationMeta(
    'picture',
  );
  @override
  late final GeneratedColumn<Uint8List> picture = GeneratedColumn<Uint8List>(
    'picture',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sessionTokenMeta = const VerificationMeta(
    'sessionToken',
  );
  @override
  late final GeneratedColumn<Uint8List> sessionToken =
      GeneratedColumn<Uint8List>(
        'session_token',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    nickname,
    email,
    gender,
    phoneNumber,
    latitude,
    longitude,
    locationLabel,
    picture,
    sessionToken,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'client_session_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientSessionTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('location_label')) {
      context.handle(
        _locationLabelMeta,
        locationLabel.isAcceptableOrUnknown(
          data['location_label']!,
          _locationLabelMeta,
        ),
      );
    }
    if (data.containsKey('picture')) {
      context.handle(
        _pictureMeta,
        picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta),
      );
    }
    if (data.containsKey('session_token')) {
      context.handle(
        _sessionTokenMeta,
        sessionToken.isAcceptableOrUnknown(
          data['session_token']!,
          _sessionTokenMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionTokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ClientSessionTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientSessionTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gender'],
      ),
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      locationLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_label'],
      ),
      picture: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}picture'],
      ),
      sessionToken: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}session_token'],
      )!,
    );
  }

  @override
  $ClientSessionTblTable createAlias(String alias) {
    return $ClientSessionTblTable(attachedDatabase, alias);
  }
}

class ClientSessionTblData extends DataClass
    implements Insertable<ClientSessionTblData> {
  final int id;
  final String name;
  final String? nickname;
  final String email;
  final int? gender;
  final String? phoneNumber;
  final double? latitude;
  final double? longitude;
  final String? locationLabel;
  final Uint8List? picture;
  final Uint8List sessionToken;
  const ClientSessionTblData({
    required this.id,
    required this.name,
    this.nickname,
    required this.email,
    this.gender,
    this.phoneNumber,
    this.latitude,
    this.longitude,
    this.locationLabel,
    this.picture,
    required this.sessionToken,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<int>(gender);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || locationLabel != null) {
      map['location_label'] = Variable<String>(locationLabel);
    }
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<Uint8List>(picture);
    }
    map['session_token'] = Variable<Uint8List>(sessionToken);
    return map;
  }

  ClientSessionTblCompanion toCompanion(bool nullToAbsent) {
    return ClientSessionTblCompanion(
      id: Value(id),
      name: Value(name),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      email: Value(email),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      locationLabel: locationLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(locationLabel),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      sessionToken: Value(sessionToken),
    );
  }

  factory ClientSessionTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientSessionTblData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      email: serializer.fromJson<String>(json['email']),
      gender: serializer.fromJson<int?>(json['gender']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      locationLabel: serializer.fromJson<String?>(json['locationLabel']),
      picture: serializer.fromJson<Uint8List?>(json['picture']),
      sessionToken: serializer.fromJson<Uint8List>(json['sessionToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nickname': serializer.toJson<String?>(nickname),
      'email': serializer.toJson<String>(email),
      'gender': serializer.toJson<int?>(gender),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'locationLabel': serializer.toJson<String?>(locationLabel),
      'picture': serializer.toJson<Uint8List?>(picture),
      'sessionToken': serializer.toJson<Uint8List>(sessionToken),
    };
  }

  ClientSessionTblData copyWith({
    int? id,
    String? name,
    Value<String?> nickname = const Value.absent(),
    String? email,
    Value<int?> gender = const Value.absent(),
    Value<String?> phoneNumber = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<String?> locationLabel = const Value.absent(),
    Value<Uint8List?> picture = const Value.absent(),
    Uint8List? sessionToken,
  }) => ClientSessionTblData(
    id: id ?? this.id,
    name: name ?? this.name,
    nickname: nickname.present ? nickname.value : this.nickname,
    email: email ?? this.email,
    gender: gender.present ? gender.value : this.gender,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    locationLabel: locationLabel.present
        ? locationLabel.value
        : this.locationLabel,
    picture: picture.present ? picture.value : this.picture,
    sessionToken: sessionToken ?? this.sessionToken,
  );
  ClientSessionTblData copyWithCompanion(ClientSessionTblCompanion data) {
    return ClientSessionTblData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      email: data.email.present ? data.email.value : this.email,
      gender: data.gender.present ? data.gender.value : this.gender,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      locationLabel: data.locationLabel.present
          ? data.locationLabel.value
          : this.locationLabel,
      picture: data.picture.present ? data.picture.value : this.picture,
      sessionToken: data.sessionToken.present
          ? data.sessionToken.value
          : this.sessionToken,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientSessionTblData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickname: $nickname, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('locationLabel: $locationLabel, ')
          ..write('picture: $picture, ')
          ..write('sessionToken: $sessionToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    nickname,
    email,
    gender,
    phoneNumber,
    latitude,
    longitude,
    locationLabel,
    $driftBlobEquality.hash(picture),
    $driftBlobEquality.hash(sessionToken),
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientSessionTblData &&
          other.id == this.id &&
          other.name == this.name &&
          other.nickname == this.nickname &&
          other.email == this.email &&
          other.gender == this.gender &&
          other.phoneNumber == this.phoneNumber &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.locationLabel == this.locationLabel &&
          $driftBlobEquality.equals(other.picture, this.picture) &&
          $driftBlobEquality.equals(other.sessionToken, this.sessionToken));
}

class ClientSessionTblCompanion extends UpdateCompanion<ClientSessionTblData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> nickname;
  final Value<String> email;
  final Value<int?> gender;
  final Value<String?> phoneNumber;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> locationLabel;
  final Value<Uint8List?> picture;
  final Value<Uint8List> sessionToken;
  final Value<int> rowid;
  const ClientSessionTblCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nickname = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.locationLabel = const Value.absent(),
    this.picture = const Value.absent(),
    this.sessionToken = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientSessionTblCompanion.insert({
    required int id,
    required String name,
    this.nickname = const Value.absent(),
    required String email,
    this.gender = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.locationLabel = const Value.absent(),
    this.picture = const Value.absent(),
    required Uint8List sessionToken,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       email = Value(email),
       sessionToken = Value(sessionToken);
  static Insertable<ClientSessionTblData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nickname,
    Expression<String>? email,
    Expression<int>? gender,
    Expression<String>? phoneNumber,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? locationLabel,
    Expression<Uint8List>? picture,
    Expression<Uint8List>? sessionToken,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nickname != null) 'nickname': nickname,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (locationLabel != null) 'location_label': locationLabel,
      if (picture != null) 'picture': picture,
      if (sessionToken != null) 'session_token': sessionToken,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientSessionTblCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? nickname,
    Value<String>? email,
    Value<int?>? gender,
    Value<String?>? phoneNumber,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<String?>? locationLabel,
    Value<Uint8List?>? picture,
    Value<Uint8List>? sessionToken,
    Value<int>? rowid,
  }) {
    return ClientSessionTblCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locationLabel: locationLabel ?? this.locationLabel,
      picture: picture ?? this.picture,
      sessionToken: sessionToken ?? this.sessionToken,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (locationLabel.present) {
      map['location_label'] = Variable<String>(locationLabel.value);
    }
    if (picture.present) {
      map['picture'] = Variable<Uint8List>(picture.value);
    }
    if (sessionToken.present) {
      map['session_token'] = Variable<Uint8List>(sessionToken.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientSessionTblCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickname: $nickname, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('locationLabel: $locationLabel, ')
          ..write('picture: $picture, ')
          ..write('sessionToken: $sessionToken, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HealthCenterTblTable extends HealthCenterTbl
    with TableInfo<$HealthCenterTblTable, HealthCenterTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthCenterTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewCountMeta = const VerificationMeta(
    'reviewCount',
  );
  @override
  late final GeneratedColumn<int> reviewCount = GeneratedColumn<int>(
    'review_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isHospitalMeta = const VerificationMeta(
    'isHospital',
  );
  @override
  late final GeneratedColumn<bool> isHospital = GeneratedColumn<bool>(
    'is_hospital',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hospital" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
  );
  static const VerificationMeta _tileXMeta = const VerificationMeta('tileX');
  @override
  late final GeneratedColumn<int> tileX = GeneratedColumn<int>(
    'tile_x',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tileYMeta = const VerificationMeta('tileY');
  @override
  late final GeneratedColumn<int> tileY = GeneratedColumn<int>(
    'tile_y',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pictureMeta = const VerificationMeta(
    'picture',
  );
  @override
  late final GeneratedColumn<Uint8List> picture = GeneratedColumn<Uint8List>(
    'picture',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    address,
    rating,
    reviewCount,
    latitude,
    longitude,
    isHospital,
    isFavorite,
    tileX,
    tileY,
    picture,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_center_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<HealthCenterTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('review_count')) {
      context.handle(
        _reviewCountMeta,
        reviewCount.isAcceptableOrUnknown(
          data['review_count']!,
          _reviewCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reviewCountMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('is_hospital')) {
      context.handle(
        _isHospitalMeta,
        isHospital.isAcceptableOrUnknown(data['is_hospital']!, _isHospitalMeta),
      );
    } else if (isInserting) {
      context.missing(_isHospitalMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    if (data.containsKey('tile_x')) {
      context.handle(
        _tileXMeta,
        tileX.isAcceptableOrUnknown(data['tile_x']!, _tileXMeta),
      );
    } else if (isInserting) {
      context.missing(_tileXMeta);
    }
    if (data.containsKey('tile_y')) {
      context.handle(
        _tileYMeta,
        tileY.isAcceptableOrUnknown(data['tile_y']!, _tileYMeta),
      );
    } else if (isInserting) {
      context.missing(_tileYMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(
        _pictureMeta,
        picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HealthCenterTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthCenterTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      reviewCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_count'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      isHospital: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_hospital'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      tileX: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tile_x'],
      )!,
      tileY: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tile_y'],
      )!,
      picture: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}picture'],
      ),
    );
  }

  @override
  $HealthCenterTblTable createAlias(String alias) {
    return $HealthCenterTblTable(attachedDatabase, alias);
  }
}

class HealthCenterTblData extends DataClass
    implements Insertable<HealthCenterTblData> {
  final int id;
  final String name;
  final String address;
  final double rating;
  final int reviewCount;
  final double latitude;
  final double longitude;
  final bool isHospital;
  final bool isFavorite;
  final int tileX;
  final int tileY;
  final Uint8List? picture;
  const HealthCenterTblData({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.latitude,
    required this.longitude,
    required this.isHospital,
    required this.isFavorite,
    required this.tileX,
    required this.tileY,
    this.picture,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['rating'] = Variable<double>(rating);
    map['review_count'] = Variable<int>(reviewCount);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['is_hospital'] = Variable<bool>(isHospital);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['tile_x'] = Variable<int>(tileX);
    map['tile_y'] = Variable<int>(tileY);
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<Uint8List>(picture);
    }
    return map;
  }

  HealthCenterTblCompanion toCompanion(bool nullToAbsent) {
    return HealthCenterTblCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      rating: Value(rating),
      reviewCount: Value(reviewCount),
      latitude: Value(latitude),
      longitude: Value(longitude),
      isHospital: Value(isHospital),
      isFavorite: Value(isFavorite),
      tileX: Value(tileX),
      tileY: Value(tileY),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
    );
  }

  factory HealthCenterTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthCenterTblData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      rating: serializer.fromJson<double>(json['rating']),
      reviewCount: serializer.fromJson<int>(json['reviewCount']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      isHospital: serializer.fromJson<bool>(json['isHospital']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      tileX: serializer.fromJson<int>(json['tileX']),
      tileY: serializer.fromJson<int>(json['tileY']),
      picture: serializer.fromJson<Uint8List?>(json['picture']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'rating': serializer.toJson<double>(rating),
      'reviewCount': serializer.toJson<int>(reviewCount),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'isHospital': serializer.toJson<bool>(isHospital),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'tileX': serializer.toJson<int>(tileX),
      'tileY': serializer.toJson<int>(tileY),
      'picture': serializer.toJson<Uint8List?>(picture),
    };
  }

  HealthCenterTblData copyWith({
    int? id,
    String? name,
    String? address,
    double? rating,
    int? reviewCount,
    double? latitude,
    double? longitude,
    bool? isHospital,
    bool? isFavorite,
    int? tileX,
    int? tileY,
    Value<Uint8List?> picture = const Value.absent(),
  }) => HealthCenterTblData(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address ?? this.address,
    rating: rating ?? this.rating,
    reviewCount: reviewCount ?? this.reviewCount,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    isHospital: isHospital ?? this.isHospital,
    isFavorite: isFavorite ?? this.isFavorite,
    tileX: tileX ?? this.tileX,
    tileY: tileY ?? this.tileY,
    picture: picture.present ? picture.value : this.picture,
  );
  HealthCenterTblData copyWithCompanion(HealthCenterTblCompanion data) {
    return HealthCenterTblData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      rating: data.rating.present ? data.rating.value : this.rating,
      reviewCount: data.reviewCount.present
          ? data.reviewCount.value
          : this.reviewCount,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      isHospital: data.isHospital.present
          ? data.isHospital.value
          : this.isHospital,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      tileX: data.tileX.present ? data.tileX.value : this.tileX,
      tileY: data.tileY.present ? data.tileY.value : this.tileY,
      picture: data.picture.present ? data.picture.value : this.picture,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthCenterTblData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isHospital: $isHospital, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('tileX: $tileX, ')
          ..write('tileY: $tileY, ')
          ..write('picture: $picture')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    address,
    rating,
    reviewCount,
    latitude,
    longitude,
    isHospital,
    isFavorite,
    tileX,
    tileY,
    $driftBlobEquality.hash(picture),
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthCenterTblData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.rating == this.rating &&
          other.reviewCount == this.reviewCount &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.isHospital == this.isHospital &&
          other.isFavorite == this.isFavorite &&
          other.tileX == this.tileX &&
          other.tileY == this.tileY &&
          $driftBlobEquality.equals(other.picture, this.picture));
}

class HealthCenterTblCompanion extends UpdateCompanion<HealthCenterTblData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<double> rating;
  final Value<int> reviewCount;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<bool> isHospital;
  final Value<bool> isFavorite;
  final Value<int> tileX;
  final Value<int> tileY;
  final Value<Uint8List?> picture;
  final Value<int> rowid;
  const HealthCenterTblCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewCount = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.isHospital = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.tileX = const Value.absent(),
    this.tileY = const Value.absent(),
    this.picture = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HealthCenterTblCompanion.insert({
    required int id,
    required String name,
    required String address,
    required double rating,
    required int reviewCount,
    required double latitude,
    required double longitude,
    required bool isHospital,
    required bool isFavorite,
    required int tileX,
    required int tileY,
    this.picture = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       address = Value(address),
       rating = Value(rating),
       reviewCount = Value(reviewCount),
       latitude = Value(latitude),
       longitude = Value(longitude),
       isHospital = Value(isHospital),
       isFavorite = Value(isFavorite),
       tileX = Value(tileX),
       tileY = Value(tileY);
  static Insertable<HealthCenterTblData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<double>? rating,
    Expression<int>? reviewCount,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<bool>? isHospital,
    Expression<bool>? isFavorite,
    Expression<int>? tileX,
    Expression<int>? tileY,
    Expression<Uint8List>? picture,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (rating != null) 'rating': rating,
      if (reviewCount != null) 'review_count': reviewCount,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (isHospital != null) 'is_hospital': isHospital,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (tileX != null) 'tile_x': tileX,
      if (tileY != null) 'tile_y': tileY,
      if (picture != null) 'picture': picture,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HealthCenterTblCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? address,
    Value<double>? rating,
    Value<int>? reviewCount,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<bool>? isHospital,
    Value<bool>? isFavorite,
    Value<int>? tileX,
    Value<int>? tileY,
    Value<Uint8List?>? picture,
    Value<int>? rowid,
  }) {
    return HealthCenterTblCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isHospital: isHospital ?? this.isHospital,
      isFavorite: isFavorite ?? this.isFavorite,
      tileX: tileX ?? this.tileX,
      tileY: tileY ?? this.tileY,
      picture: picture ?? this.picture,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (reviewCount.present) {
      map['review_count'] = Variable<int>(reviewCount.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (isHospital.present) {
      map['is_hospital'] = Variable<bool>(isHospital.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (tileX.present) {
      map['tile_x'] = Variable<int>(tileX.value);
    }
    if (tileY.present) {
      map['tile_y'] = Variable<int>(tileY.value);
    }
    if (picture.present) {
      map['picture'] = Variable<Uint8List>(picture.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthCenterTblCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isHospital: $isHospital, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('tileX: $tileX, ')
          ..write('tileY: $tileY, ')
          ..write('picture: $picture, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoctorTblTable extends DoctorTbl
    with TableInfo<$DoctorTblTable, DoctorTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoctorTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewCountMeta = const VerificationMeta(
    'reviewCount',
  );
  @override
  late final GeneratedColumn<int> reviewCount = GeneratedColumn<int>(
    'review_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
  );
  static const VerificationMeta _tileXMeta = const VerificationMeta('tileX');
  @override
  late final GeneratedColumn<int> tileX = GeneratedColumn<int>(
    'tile_x',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tileYMeta = const VerificationMeta('tileY');
  @override
  late final GeneratedColumn<int> tileY = GeneratedColumn<int>(
    'tile_y',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialtyMeta = const VerificationMeta(
    'specialty',
  );
  @override
  late final GeneratedColumn<int> specialty = GeneratedColumn<int>(
    'specialty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pictureMeta = const VerificationMeta(
    'picture',
  );
  @override
  late final GeneratedColumn<Uint8List> picture = GeneratedColumn<Uint8List>(
    'picture',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _patientsCountMeta = const VerificationMeta(
    'patientsCount',
  );
  @override
  late final GeneratedColumn<int> patientsCount = GeneratedColumn<int>(
    'patients_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearsOfExperienceMeta = const VerificationMeta(
    'yearsOfExperience',
  );
  @override
  late final GeneratedColumn<int> yearsOfExperience = GeneratedColumn<int>(
    'years_of_experience',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
    'bio',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayStartMinMeta = const VerificationMeta(
    'dayStartMin',
  );
  @override
  late final GeneratedColumn<int> dayStartMin = GeneratedColumn<int>(
    'day_start_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayEndMinMeta = const VerificationMeta(
    'dayEndMin',
  );
  @override
  late final GeneratedColumn<int> dayEndMin = GeneratedColumn<int>(
    'day_end_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visitDurationMeta = const VerificationMeta(
    'visitDuration',
  );
  @override
  late final GeneratedColumn<int> visitDuration = GeneratedColumn<int>(
    'visit_duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDayMeta = const VerificationMeta(
    'startDay',
  );
  @override
  late final GeneratedColumn<int> startDay = GeneratedColumn<int>(
    'start_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDayMeta = const VerificationMeta('endDay');
  @override
  late final GeneratedColumn<int> endDay = GeneratedColumn<int>(
    'end_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    address,
    rating,
    reviewCount,
    latitude,
    longitude,
    isFavorite,
    tileX,
    tileY,
    specialty,
    picture,
    patientsCount,
    yearsOfExperience,
    bio,
    dayStartMin,
    dayEndMin,
    visitDuration,
    startDay,
    endDay,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'doctor_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoctorTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('review_count')) {
      context.handle(
        _reviewCountMeta,
        reviewCount.isAcceptableOrUnknown(
          data['review_count']!,
          _reviewCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reviewCountMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    if (data.containsKey('tile_x')) {
      context.handle(
        _tileXMeta,
        tileX.isAcceptableOrUnknown(data['tile_x']!, _tileXMeta),
      );
    } else if (isInserting) {
      context.missing(_tileXMeta);
    }
    if (data.containsKey('tile_y')) {
      context.handle(
        _tileYMeta,
        tileY.isAcceptableOrUnknown(data['tile_y']!, _tileYMeta),
      );
    } else if (isInserting) {
      context.missing(_tileYMeta);
    }
    if (data.containsKey('specialty')) {
      context.handle(
        _specialtyMeta,
        specialty.isAcceptableOrUnknown(data['specialty']!, _specialtyMeta),
      );
    } else if (isInserting) {
      context.missing(_specialtyMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(
        _pictureMeta,
        picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta),
      );
    }
    if (data.containsKey('patients_count')) {
      context.handle(
        _patientsCountMeta,
        patientsCount.isAcceptableOrUnknown(
          data['patients_count']!,
          _patientsCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_patientsCountMeta);
    }
    if (data.containsKey('years_of_experience')) {
      context.handle(
        _yearsOfExperienceMeta,
        yearsOfExperience.isAcceptableOrUnknown(
          data['years_of_experience']!,
          _yearsOfExperienceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_yearsOfExperienceMeta);
    }
    if (data.containsKey('bio')) {
      context.handle(
        _bioMeta,
        bio.isAcceptableOrUnknown(data['bio']!, _bioMeta),
      );
    } else if (isInserting) {
      context.missing(_bioMeta);
    }
    if (data.containsKey('day_start_min')) {
      context.handle(
        _dayStartMinMeta,
        dayStartMin.isAcceptableOrUnknown(
          data['day_start_min']!,
          _dayStartMinMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dayStartMinMeta);
    }
    if (data.containsKey('day_end_min')) {
      context.handle(
        _dayEndMinMeta,
        dayEndMin.isAcceptableOrUnknown(data['day_end_min']!, _dayEndMinMeta),
      );
    } else if (isInserting) {
      context.missing(_dayEndMinMeta);
    }
    if (data.containsKey('visit_duration')) {
      context.handle(
        _visitDurationMeta,
        visitDuration.isAcceptableOrUnknown(
          data['visit_duration']!,
          _visitDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_visitDurationMeta);
    }
    if (data.containsKey('start_day')) {
      context.handle(
        _startDayMeta,
        startDay.isAcceptableOrUnknown(data['start_day']!, _startDayMeta),
      );
    } else if (isInserting) {
      context.missing(_startDayMeta);
    }
    if (data.containsKey('end_day')) {
      context.handle(
        _endDayMeta,
        endDay.isAcceptableOrUnknown(data['end_day']!, _endDayMeta),
      );
    } else if (isInserting) {
      context.missing(_endDayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DoctorTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoctorTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      reviewCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_count'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      tileX: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tile_x'],
      )!,
      tileY: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tile_y'],
      )!,
      specialty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}specialty'],
      )!,
      picture: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}picture'],
      ),
      patientsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patients_count'],
      )!,
      yearsOfExperience: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}years_of_experience'],
      )!,
      bio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bio'],
      )!,
      dayStartMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_start_min'],
      )!,
      dayEndMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_end_min'],
      )!,
      visitDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}visit_duration'],
      )!,
      startDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_day'],
      )!,
      endDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_day'],
      )!,
    );
  }

  @override
  $DoctorTblTable createAlias(String alias) {
    return $DoctorTblTable(attachedDatabase, alias);
  }
}

class DoctorTblData extends DataClass implements Insertable<DoctorTblData> {
  final int id;
  final String name;
  final String address;
  final double rating;
  final int reviewCount;
  final double latitude;
  final double longitude;
  final bool isFavorite;
  final int tileX;
  final int tileY;
  final int specialty;
  final Uint8List? picture;
  final int patientsCount;
  final int yearsOfExperience;
  final String bio;
  final int dayStartMin;
  final int dayEndMin;
  final int visitDuration;
  final int startDay;
  final int endDay;
  const DoctorTblData({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.latitude,
    required this.longitude,
    required this.isFavorite,
    required this.tileX,
    required this.tileY,
    required this.specialty,
    this.picture,
    required this.patientsCount,
    required this.yearsOfExperience,
    required this.bio,
    required this.dayStartMin,
    required this.dayEndMin,
    required this.visitDuration,
    required this.startDay,
    required this.endDay,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['rating'] = Variable<double>(rating);
    map['review_count'] = Variable<int>(reviewCount);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['tile_x'] = Variable<int>(tileX);
    map['tile_y'] = Variable<int>(tileY);
    map['specialty'] = Variable<int>(specialty);
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<Uint8List>(picture);
    }
    map['patients_count'] = Variable<int>(patientsCount);
    map['years_of_experience'] = Variable<int>(yearsOfExperience);
    map['bio'] = Variable<String>(bio);
    map['day_start_min'] = Variable<int>(dayStartMin);
    map['day_end_min'] = Variable<int>(dayEndMin);
    map['visit_duration'] = Variable<int>(visitDuration);
    map['start_day'] = Variable<int>(startDay);
    map['end_day'] = Variable<int>(endDay);
    return map;
  }

  DoctorTblCompanion toCompanion(bool nullToAbsent) {
    return DoctorTblCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      rating: Value(rating),
      reviewCount: Value(reviewCount),
      latitude: Value(latitude),
      longitude: Value(longitude),
      isFavorite: Value(isFavorite),
      tileX: Value(tileX),
      tileY: Value(tileY),
      specialty: Value(specialty),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      patientsCount: Value(patientsCount),
      yearsOfExperience: Value(yearsOfExperience),
      bio: Value(bio),
      dayStartMin: Value(dayStartMin),
      dayEndMin: Value(dayEndMin),
      visitDuration: Value(visitDuration),
      startDay: Value(startDay),
      endDay: Value(endDay),
    );
  }

  factory DoctorTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoctorTblData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      rating: serializer.fromJson<double>(json['rating']),
      reviewCount: serializer.fromJson<int>(json['reviewCount']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      tileX: serializer.fromJson<int>(json['tileX']),
      tileY: serializer.fromJson<int>(json['tileY']),
      specialty: serializer.fromJson<int>(json['specialty']),
      picture: serializer.fromJson<Uint8List?>(json['picture']),
      patientsCount: serializer.fromJson<int>(json['patientsCount']),
      yearsOfExperience: serializer.fromJson<int>(json['yearsOfExperience']),
      bio: serializer.fromJson<String>(json['bio']),
      dayStartMin: serializer.fromJson<int>(json['dayStartMin']),
      dayEndMin: serializer.fromJson<int>(json['dayEndMin']),
      visitDuration: serializer.fromJson<int>(json['visitDuration']),
      startDay: serializer.fromJson<int>(json['startDay']),
      endDay: serializer.fromJson<int>(json['endDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'rating': serializer.toJson<double>(rating),
      'reviewCount': serializer.toJson<int>(reviewCount),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'tileX': serializer.toJson<int>(tileX),
      'tileY': serializer.toJson<int>(tileY),
      'specialty': serializer.toJson<int>(specialty),
      'picture': serializer.toJson<Uint8List?>(picture),
      'patientsCount': serializer.toJson<int>(patientsCount),
      'yearsOfExperience': serializer.toJson<int>(yearsOfExperience),
      'bio': serializer.toJson<String>(bio),
      'dayStartMin': serializer.toJson<int>(dayStartMin),
      'dayEndMin': serializer.toJson<int>(dayEndMin),
      'visitDuration': serializer.toJson<int>(visitDuration),
      'startDay': serializer.toJson<int>(startDay),
      'endDay': serializer.toJson<int>(endDay),
    };
  }

  DoctorTblData copyWith({
    int? id,
    String? name,
    String? address,
    double? rating,
    int? reviewCount,
    double? latitude,
    double? longitude,
    bool? isFavorite,
    int? tileX,
    int? tileY,
    int? specialty,
    Value<Uint8List?> picture = const Value.absent(),
    int? patientsCount,
    int? yearsOfExperience,
    String? bio,
    int? dayStartMin,
    int? dayEndMin,
    int? visitDuration,
    int? startDay,
    int? endDay,
  }) => DoctorTblData(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address ?? this.address,
    rating: rating ?? this.rating,
    reviewCount: reviewCount ?? this.reviewCount,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    isFavorite: isFavorite ?? this.isFavorite,
    tileX: tileX ?? this.tileX,
    tileY: tileY ?? this.tileY,
    specialty: specialty ?? this.specialty,
    picture: picture.present ? picture.value : this.picture,
    patientsCount: patientsCount ?? this.patientsCount,
    yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
    bio: bio ?? this.bio,
    dayStartMin: dayStartMin ?? this.dayStartMin,
    dayEndMin: dayEndMin ?? this.dayEndMin,
    visitDuration: visitDuration ?? this.visitDuration,
    startDay: startDay ?? this.startDay,
    endDay: endDay ?? this.endDay,
  );
  DoctorTblData copyWithCompanion(DoctorTblCompanion data) {
    return DoctorTblData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      rating: data.rating.present ? data.rating.value : this.rating,
      reviewCount: data.reviewCount.present
          ? data.reviewCount.value
          : this.reviewCount,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      tileX: data.tileX.present ? data.tileX.value : this.tileX,
      tileY: data.tileY.present ? data.tileY.value : this.tileY,
      specialty: data.specialty.present ? data.specialty.value : this.specialty,
      picture: data.picture.present ? data.picture.value : this.picture,
      patientsCount: data.patientsCount.present
          ? data.patientsCount.value
          : this.patientsCount,
      yearsOfExperience: data.yearsOfExperience.present
          ? data.yearsOfExperience.value
          : this.yearsOfExperience,
      bio: data.bio.present ? data.bio.value : this.bio,
      dayStartMin: data.dayStartMin.present
          ? data.dayStartMin.value
          : this.dayStartMin,
      dayEndMin: data.dayEndMin.present ? data.dayEndMin.value : this.dayEndMin,
      visitDuration: data.visitDuration.present
          ? data.visitDuration.value
          : this.visitDuration,
      startDay: data.startDay.present ? data.startDay.value : this.startDay,
      endDay: data.endDay.present ? data.endDay.value : this.endDay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoctorTblData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('tileX: $tileX, ')
          ..write('tileY: $tileY, ')
          ..write('specialty: $specialty, ')
          ..write('picture: $picture, ')
          ..write('patientsCount: $patientsCount, ')
          ..write('yearsOfExperience: $yearsOfExperience, ')
          ..write('bio: $bio, ')
          ..write('dayStartMin: $dayStartMin, ')
          ..write('dayEndMin: $dayEndMin, ')
          ..write('visitDuration: $visitDuration, ')
          ..write('startDay: $startDay, ')
          ..write('endDay: $endDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    address,
    rating,
    reviewCount,
    latitude,
    longitude,
    isFavorite,
    tileX,
    tileY,
    specialty,
    $driftBlobEquality.hash(picture),
    patientsCount,
    yearsOfExperience,
    bio,
    dayStartMin,
    dayEndMin,
    visitDuration,
    startDay,
    endDay,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorTblData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.rating == this.rating &&
          other.reviewCount == this.reviewCount &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.isFavorite == this.isFavorite &&
          other.tileX == this.tileX &&
          other.tileY == this.tileY &&
          other.specialty == this.specialty &&
          $driftBlobEquality.equals(other.picture, this.picture) &&
          other.patientsCount == this.patientsCount &&
          other.yearsOfExperience == this.yearsOfExperience &&
          other.bio == this.bio &&
          other.dayStartMin == this.dayStartMin &&
          other.dayEndMin == this.dayEndMin &&
          other.visitDuration == this.visitDuration &&
          other.startDay == this.startDay &&
          other.endDay == this.endDay);
}

class DoctorTblCompanion extends UpdateCompanion<DoctorTblData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<double> rating;
  final Value<int> reviewCount;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<bool> isFavorite;
  final Value<int> tileX;
  final Value<int> tileY;
  final Value<int> specialty;
  final Value<Uint8List?> picture;
  final Value<int> patientsCount;
  final Value<int> yearsOfExperience;
  final Value<String> bio;
  final Value<int> dayStartMin;
  final Value<int> dayEndMin;
  final Value<int> visitDuration;
  final Value<int> startDay;
  final Value<int> endDay;
  final Value<int> rowid;
  const DoctorTblCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewCount = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.tileX = const Value.absent(),
    this.tileY = const Value.absent(),
    this.specialty = const Value.absent(),
    this.picture = const Value.absent(),
    this.patientsCount = const Value.absent(),
    this.yearsOfExperience = const Value.absent(),
    this.bio = const Value.absent(),
    this.dayStartMin = const Value.absent(),
    this.dayEndMin = const Value.absent(),
    this.visitDuration = const Value.absent(),
    this.startDay = const Value.absent(),
    this.endDay = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoctorTblCompanion.insert({
    required int id,
    required String name,
    required String address,
    required double rating,
    required int reviewCount,
    required double latitude,
    required double longitude,
    required bool isFavorite,
    required int tileX,
    required int tileY,
    required int specialty,
    this.picture = const Value.absent(),
    required int patientsCount,
    required int yearsOfExperience,
    required String bio,
    required int dayStartMin,
    required int dayEndMin,
    required int visitDuration,
    required int startDay,
    required int endDay,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       address = Value(address),
       rating = Value(rating),
       reviewCount = Value(reviewCount),
       latitude = Value(latitude),
       longitude = Value(longitude),
       isFavorite = Value(isFavorite),
       tileX = Value(tileX),
       tileY = Value(tileY),
       specialty = Value(specialty),
       patientsCount = Value(patientsCount),
       yearsOfExperience = Value(yearsOfExperience),
       bio = Value(bio),
       dayStartMin = Value(dayStartMin),
       dayEndMin = Value(dayEndMin),
       visitDuration = Value(visitDuration),
       startDay = Value(startDay),
       endDay = Value(endDay);
  static Insertable<DoctorTblData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<double>? rating,
    Expression<int>? reviewCount,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<bool>? isFavorite,
    Expression<int>? tileX,
    Expression<int>? tileY,
    Expression<int>? specialty,
    Expression<Uint8List>? picture,
    Expression<int>? patientsCount,
    Expression<int>? yearsOfExperience,
    Expression<String>? bio,
    Expression<int>? dayStartMin,
    Expression<int>? dayEndMin,
    Expression<int>? visitDuration,
    Expression<int>? startDay,
    Expression<int>? endDay,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (rating != null) 'rating': rating,
      if (reviewCount != null) 'review_count': reviewCount,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (tileX != null) 'tile_x': tileX,
      if (tileY != null) 'tile_y': tileY,
      if (specialty != null) 'specialty': specialty,
      if (picture != null) 'picture': picture,
      if (patientsCount != null) 'patients_count': patientsCount,
      if (yearsOfExperience != null) 'years_of_experience': yearsOfExperience,
      if (bio != null) 'bio': bio,
      if (dayStartMin != null) 'day_start_min': dayStartMin,
      if (dayEndMin != null) 'day_end_min': dayEndMin,
      if (visitDuration != null) 'visit_duration': visitDuration,
      if (startDay != null) 'start_day': startDay,
      if (endDay != null) 'end_day': endDay,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoctorTblCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? address,
    Value<double>? rating,
    Value<int>? reviewCount,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<bool>? isFavorite,
    Value<int>? tileX,
    Value<int>? tileY,
    Value<int>? specialty,
    Value<Uint8List?>? picture,
    Value<int>? patientsCount,
    Value<int>? yearsOfExperience,
    Value<String>? bio,
    Value<int>? dayStartMin,
    Value<int>? dayEndMin,
    Value<int>? visitDuration,
    Value<int>? startDay,
    Value<int>? endDay,
    Value<int>? rowid,
  }) {
    return DoctorTblCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isFavorite: isFavorite ?? this.isFavorite,
      tileX: tileX ?? this.tileX,
      tileY: tileY ?? this.tileY,
      specialty: specialty ?? this.specialty,
      picture: picture ?? this.picture,
      patientsCount: patientsCount ?? this.patientsCount,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      bio: bio ?? this.bio,
      dayStartMin: dayStartMin ?? this.dayStartMin,
      dayEndMin: dayEndMin ?? this.dayEndMin,
      visitDuration: visitDuration ?? this.visitDuration,
      startDay: startDay ?? this.startDay,
      endDay: endDay ?? this.endDay,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (reviewCount.present) {
      map['review_count'] = Variable<int>(reviewCount.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (tileX.present) {
      map['tile_x'] = Variable<int>(tileX.value);
    }
    if (tileY.present) {
      map['tile_y'] = Variable<int>(tileY.value);
    }
    if (specialty.present) {
      map['specialty'] = Variable<int>(specialty.value);
    }
    if (picture.present) {
      map['picture'] = Variable<Uint8List>(picture.value);
    }
    if (patientsCount.present) {
      map['patients_count'] = Variable<int>(patientsCount.value);
    }
    if (yearsOfExperience.present) {
      map['years_of_experience'] = Variable<int>(yearsOfExperience.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (dayStartMin.present) {
      map['day_start_min'] = Variable<int>(dayStartMin.value);
    }
    if (dayEndMin.present) {
      map['day_end_min'] = Variable<int>(dayEndMin.value);
    }
    if (visitDuration.present) {
      map['visit_duration'] = Variable<int>(visitDuration.value);
    }
    if (startDay.present) {
      map['start_day'] = Variable<int>(startDay.value);
    }
    if (endDay.present) {
      map['end_day'] = Variable<int>(endDay.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorTblCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('tileX: $tileX, ')
          ..write('tileY: $tileY, ')
          ..write('specialty: $specialty, ')
          ..write('picture: $picture, ')
          ..write('patientsCount: $patientsCount, ')
          ..write('yearsOfExperience: $yearsOfExperience, ')
          ..write('bio: $bio, ')
          ..write('dayStartMin: $dayStartMin, ')
          ..write('dayEndMin: $dayEndMin, ')
          ..write('visitDuration: $visitDuration, ')
          ..write('startDay: $startDay, ')
          ..write('endDay: $endDay, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BookingTable extends Booking with TableInfo<$BookingTable, BookingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _doctorMeta = const VerificationMeta('doctor');
  @override
  late final GeneratedColumn<int> doctor = GeneratedColumn<int>(
    'doctor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _datetimeMeta = const VerificationMeta(
    'datetime',
  );
  @override
  late final GeneratedColumn<DateTime> datetime = GeneratedColumn<DateTime>(
    'datetime',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCanceledMeta = const VerificationMeta(
    'isCanceled',
  );
  @override
  late final GeneratedColumn<bool> isCanceled = GeneratedColumn<bool>(
    'is_canceled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_canceled" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, doctor, datetime, isCanceled];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'booking';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookingData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('doctor')) {
      context.handle(
        _doctorMeta,
        doctor.isAcceptableOrUnknown(data['doctor']!, _doctorMeta),
      );
    } else if (isInserting) {
      context.missing(_doctorMeta);
    }
    if (data.containsKey('datetime')) {
      context.handle(
        _datetimeMeta,
        datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta),
      );
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    if (data.containsKey('is_canceled')) {
      context.handle(
        _isCanceledMeta,
        isCanceled.isAcceptableOrUnknown(data['is_canceled']!, _isCanceledMeta),
      );
    } else if (isInserting) {
      context.missing(_isCanceledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  BookingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookingData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      doctor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}doctor'],
      )!,
      datetime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}datetime'],
      )!,
      isCanceled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_canceled'],
      )!,
    );
  }

  @override
  $BookingTable createAlias(String alias) {
    return $BookingTable(attachedDatabase, alias);
  }
}

class BookingData extends DataClass implements Insertable<BookingData> {
  final int id;
  final int doctor;
  final DateTime datetime;
  final bool isCanceled;
  const BookingData({
    required this.id,
    required this.doctor,
    required this.datetime,
    required this.isCanceled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['doctor'] = Variable<int>(doctor);
    map['datetime'] = Variable<DateTime>(datetime);
    map['is_canceled'] = Variable<bool>(isCanceled);
    return map;
  }

  BookingCompanion toCompanion(bool nullToAbsent) {
    return BookingCompanion(
      id: Value(id),
      doctor: Value(doctor),
      datetime: Value(datetime),
      isCanceled: Value(isCanceled),
    );
  }

  factory BookingData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookingData(
      id: serializer.fromJson<int>(json['id']),
      doctor: serializer.fromJson<int>(json['doctor']),
      datetime: serializer.fromJson<DateTime>(json['datetime']),
      isCanceled: serializer.fromJson<bool>(json['isCanceled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'doctor': serializer.toJson<int>(doctor),
      'datetime': serializer.toJson<DateTime>(datetime),
      'isCanceled': serializer.toJson<bool>(isCanceled),
    };
  }

  BookingData copyWith({
    int? id,
    int? doctor,
    DateTime? datetime,
    bool? isCanceled,
  }) => BookingData(
    id: id ?? this.id,
    doctor: doctor ?? this.doctor,
    datetime: datetime ?? this.datetime,
    isCanceled: isCanceled ?? this.isCanceled,
  );
  BookingData copyWithCompanion(BookingCompanion data) {
    return BookingData(
      id: data.id.present ? data.id.value : this.id,
      doctor: data.doctor.present ? data.doctor.value : this.doctor,
      datetime: data.datetime.present ? data.datetime.value : this.datetime,
      isCanceled: data.isCanceled.present
          ? data.isCanceled.value
          : this.isCanceled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookingData(')
          ..write('id: $id, ')
          ..write('doctor: $doctor, ')
          ..write('datetime: $datetime, ')
          ..write('isCanceled: $isCanceled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, doctor, datetime, isCanceled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingData &&
          other.id == this.id &&
          other.doctor == this.doctor &&
          other.datetime == this.datetime &&
          other.isCanceled == this.isCanceled);
}

class BookingCompanion extends UpdateCompanion<BookingData> {
  final Value<int> id;
  final Value<int> doctor;
  final Value<DateTime> datetime;
  final Value<bool> isCanceled;
  final Value<int> rowid;
  const BookingCompanion({
    this.id = const Value.absent(),
    this.doctor = const Value.absent(),
    this.datetime = const Value.absent(),
    this.isCanceled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookingCompanion.insert({
    required int id,
    required int doctor,
    required DateTime datetime,
    required bool isCanceled,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       doctor = Value(doctor),
       datetime = Value(datetime),
       isCanceled = Value(isCanceled);
  static Insertable<BookingData> custom({
    Expression<int>? id,
    Expression<int>? doctor,
    Expression<DateTime>? datetime,
    Expression<bool>? isCanceled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (doctor != null) 'doctor': doctor,
      if (datetime != null) 'datetime': datetime,
      if (isCanceled != null) 'is_canceled': isCanceled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookingCompanion copyWith({
    Value<int>? id,
    Value<int>? doctor,
    Value<DateTime>? datetime,
    Value<bool>? isCanceled,
    Value<int>? rowid,
  }) {
    return BookingCompanion(
      id: id ?? this.id,
      doctor: doctor ?? this.doctor,
      datetime: datetime ?? this.datetime,
      isCanceled: isCanceled ?? this.isCanceled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (doctor.present) {
      map['doctor'] = Variable<int>(doctor.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<DateTime>(datetime.value);
    }
    if (isCanceled.present) {
      map['is_canceled'] = Variable<bool>(isCanceled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookingCompanion(')
          ..write('id: $id, ')
          ..write('doctor: $doctor, ')
          ..write('datetime: $datetime, ')
          ..write('isCanceled: $isCanceled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnreadNotificationsTblTable extends UnreadNotificationsTbl
    with TableInfo<$UnreadNotificationsTblTable, UnreadNotificationsTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnreadNotificationsTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
    'desc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<int> icon = GeneratedColumn<int>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, desc, timestamp, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unread_notifications_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnreadNotificationsTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
        _descMeta,
        desc.isAcceptableOrUnknown(data['desc']!, _descMeta),
      );
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UnreadNotificationsTblData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnreadNotificationsTblData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      desc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon'],
      ),
    );
  }

  @override
  $UnreadNotificationsTblTable createAlias(String alias) {
    return $UnreadNotificationsTblTable(attachedDatabase, alias);
  }
}

class UnreadNotificationsTblData extends DataClass
    implements Insertable<UnreadNotificationsTblData> {
  final int id;
  final String title;
  final String desc;
  final DateTime timestamp;
  final int? icon;
  const UnreadNotificationsTblData({
    required this.id,
    required this.title,
    required this.desc,
    required this.timestamp,
    this.icon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['desc'] = Variable<String>(desc);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<int>(icon);
    }
    return map;
  }

  UnreadNotificationsTblCompanion toCompanion(bool nullToAbsent) {
    return UnreadNotificationsTblCompanion(
      id: Value(id),
      title: Value(title),
      desc: Value(desc),
      timestamp: Value(timestamp),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
    );
  }

  factory UnreadNotificationsTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnreadNotificationsTblData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      desc: serializer.fromJson<String>(json['desc']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      icon: serializer.fromJson<int?>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'desc': serializer.toJson<String>(desc),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'icon': serializer.toJson<int?>(icon),
    };
  }

  UnreadNotificationsTblData copyWith({
    int? id,
    String? title,
    String? desc,
    DateTime? timestamp,
    Value<int?> icon = const Value.absent(),
  }) => UnreadNotificationsTblData(
    id: id ?? this.id,
    title: title ?? this.title,
    desc: desc ?? this.desc,
    timestamp: timestamp ?? this.timestamp,
    icon: icon.present ? icon.value : this.icon,
  );
  UnreadNotificationsTblData copyWithCompanion(
    UnreadNotificationsTblCompanion data,
  ) {
    return UnreadNotificationsTblData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      desc: data.desc.present ? data.desc.value : this.desc,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnreadNotificationsTblData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('timestamp: $timestamp, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, desc, timestamp, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnreadNotificationsTblData &&
          other.id == this.id &&
          other.title == this.title &&
          other.desc == this.desc &&
          other.timestamp == this.timestamp &&
          other.icon == this.icon);
}

class UnreadNotificationsTblCompanion
    extends UpdateCompanion<UnreadNotificationsTblData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> desc;
  final Value<DateTime> timestamp;
  final Value<int?> icon;
  final Value<int> rowid;
  const UnreadNotificationsTblCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.desc = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnreadNotificationsTblCompanion.insert({
    required int id,
    required String title,
    required String desc,
    required DateTime timestamp,
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       desc = Value(desc),
       timestamp = Value(timestamp);
  static Insertable<UnreadNotificationsTblData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? desc,
    Expression<DateTime>? timestamp,
    Expression<int>? icon,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (desc != null) 'desc': desc,
      if (timestamp != null) 'timestamp': timestamp,
      if (icon != null) 'icon': icon,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnreadNotificationsTblCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? desc,
    Value<DateTime>? timestamp,
    Value<int?>? icon,
    Value<int>? rowid,
  }) {
    return UnreadNotificationsTblCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      timestamp: timestamp ?? this.timestamp,
      icon: icon ?? this.icon,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnreadNotificationsTblCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('timestamp: $timestamp, ')
          ..write('icon: $icon, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDB extends GeneratedDatabase {
  _$LocalDB(QueryExecutor e) : super(e);
  $LocalDBManager get managers => $LocalDBManager(this);
  late final $ClientSessionTblTable clientSessionTbl = $ClientSessionTblTable(
    this,
  );
  late final $HealthCenterTblTable healthCenterTbl = $HealthCenterTblTable(
    this,
  );
  late final $DoctorTblTable doctorTbl = $DoctorTblTable(this);
  late final $BookingTable booking = $BookingTable(this);
  late final $UnreadNotificationsTblTable unreadNotificationsTbl =
      $UnreadNotificationsTblTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    clientSessionTbl,
    healthCenterTbl,
    doctorTbl,
    booking,
    unreadNotificationsTbl,
  ];
}

typedef $$ClientSessionTblTableCreateCompanionBuilder =
    ClientSessionTblCompanion Function({
      required int id,
      required String name,
      Value<String?> nickname,
      required String email,
      Value<int?> gender,
      Value<String?> phoneNumber,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> locationLabel,
      Value<Uint8List?> picture,
      required Uint8List sessionToken,
      Value<int> rowid,
    });
typedef $$ClientSessionTblTableUpdateCompanionBuilder =
    ClientSessionTblCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> nickname,
      Value<String> email,
      Value<int?> gender,
      Value<String?> phoneNumber,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> locationLabel,
      Value<Uint8List?> picture,
      Value<Uint8List> sessionToken,
      Value<int> rowid,
    });

class $$ClientSessionTblTableFilterComposer
    extends Composer<_$LocalDB, $ClientSessionTblTable> {
  $$ClientSessionTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationLabel => $composableBuilder(
    column: $table.locationLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get picture => $composableBuilder(
    column: $table.picture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get sessionToken => $composableBuilder(
    column: $table.sessionToken,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientSessionTblTableOrderingComposer
    extends Composer<_$LocalDB, $ClientSessionTblTable> {
  $$ClientSessionTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationLabel => $composableBuilder(
    column: $table.locationLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get picture => $composableBuilder(
    column: $table.picture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get sessionToken => $composableBuilder(
    column: $table.sessionToken,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientSessionTblTableAnnotationComposer
    extends Composer<_$LocalDB, $ClientSessionTblTable> {
  $$ClientSessionTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get locationLabel => $composableBuilder(
    column: $table.locationLabel,
    builder: (column) => column,
  );

  GeneratedColumn<Uint8List> get picture =>
      $composableBuilder(column: $table.picture, builder: (column) => column);

  GeneratedColumn<Uint8List> get sessionToken => $composableBuilder(
    column: $table.sessionToken,
    builder: (column) => column,
  );
}

class $$ClientSessionTblTableTableManager
    extends
        RootTableManager<
          _$LocalDB,
          $ClientSessionTblTable,
          ClientSessionTblData,
          $$ClientSessionTblTableFilterComposer,
          $$ClientSessionTblTableOrderingComposer,
          $$ClientSessionTblTableAnnotationComposer,
          $$ClientSessionTblTableCreateCompanionBuilder,
          $$ClientSessionTblTableUpdateCompanionBuilder,
          (
            ClientSessionTblData,
            BaseReferences<
              _$LocalDB,
              $ClientSessionTblTable,
              ClientSessionTblData
            >,
          ),
          ClientSessionTblData,
          PrefetchHooks Function()
        > {
  $$ClientSessionTblTableTableManager(
    _$LocalDB db,
    $ClientSessionTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientSessionTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientSessionTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientSessionTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<int?> gender = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> locationLabel = const Value.absent(),
                Value<Uint8List?> picture = const Value.absent(),
                Value<Uint8List> sessionToken = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientSessionTblCompanion(
                id: id,
                name: name,
                nickname: nickname,
                email: email,
                gender: gender,
                phoneNumber: phoneNumber,
                latitude: latitude,
                longitude: longitude,
                locationLabel: locationLabel,
                picture: picture,
                sessionToken: sessionToken,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String name,
                Value<String?> nickname = const Value.absent(),
                required String email,
                Value<int?> gender = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> locationLabel = const Value.absent(),
                Value<Uint8List?> picture = const Value.absent(),
                required Uint8List sessionToken,
                Value<int> rowid = const Value.absent(),
              }) => ClientSessionTblCompanion.insert(
                id: id,
                name: name,
                nickname: nickname,
                email: email,
                gender: gender,
                phoneNumber: phoneNumber,
                latitude: latitude,
                longitude: longitude,
                locationLabel: locationLabel,
                picture: picture,
                sessionToken: sessionToken,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientSessionTblTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDB,
      $ClientSessionTblTable,
      ClientSessionTblData,
      $$ClientSessionTblTableFilterComposer,
      $$ClientSessionTblTableOrderingComposer,
      $$ClientSessionTblTableAnnotationComposer,
      $$ClientSessionTblTableCreateCompanionBuilder,
      $$ClientSessionTblTableUpdateCompanionBuilder,
      (
        ClientSessionTblData,
        BaseReferences<_$LocalDB, $ClientSessionTblTable, ClientSessionTblData>,
      ),
      ClientSessionTblData,
      PrefetchHooks Function()
    >;
typedef $$HealthCenterTblTableCreateCompanionBuilder =
    HealthCenterTblCompanion Function({
      required int id,
      required String name,
      required String address,
      required double rating,
      required int reviewCount,
      required double latitude,
      required double longitude,
      required bool isHospital,
      required bool isFavorite,
      required int tileX,
      required int tileY,
      Value<Uint8List?> picture,
      Value<int> rowid,
    });
typedef $$HealthCenterTblTableUpdateCompanionBuilder =
    HealthCenterTblCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> address,
      Value<double> rating,
      Value<int> reviewCount,
      Value<double> latitude,
      Value<double> longitude,
      Value<bool> isHospital,
      Value<bool> isFavorite,
      Value<int> tileX,
      Value<int> tileY,
      Value<Uint8List?> picture,
      Value<int> rowid,
    });

class $$HealthCenterTblTableFilterComposer
    extends Composer<_$LocalDB, $HealthCenterTblTable> {
  $$HealthCenterTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isHospital => $composableBuilder(
    column: $table.isHospital,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tileX => $composableBuilder(
    column: $table.tileX,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tileY => $composableBuilder(
    column: $table.tileY,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get picture => $composableBuilder(
    column: $table.picture,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HealthCenterTblTableOrderingComposer
    extends Composer<_$LocalDB, $HealthCenterTblTable> {
  $$HealthCenterTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHospital => $composableBuilder(
    column: $table.isHospital,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tileX => $composableBuilder(
    column: $table.tileX,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tileY => $composableBuilder(
    column: $table.tileY,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get picture => $composableBuilder(
    column: $table.picture,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HealthCenterTblTableAnnotationComposer
    extends Composer<_$LocalDB, $HealthCenterTblTable> {
  $$HealthCenterTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<bool> get isHospital => $composableBuilder(
    column: $table.isHospital,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tileX =>
      $composableBuilder(column: $table.tileX, builder: (column) => column);

  GeneratedColumn<int> get tileY =>
      $composableBuilder(column: $table.tileY, builder: (column) => column);

  GeneratedColumn<Uint8List> get picture =>
      $composableBuilder(column: $table.picture, builder: (column) => column);
}

class $$HealthCenterTblTableTableManager
    extends
        RootTableManager<
          _$LocalDB,
          $HealthCenterTblTable,
          HealthCenterTblData,
          $$HealthCenterTblTableFilterComposer,
          $$HealthCenterTblTableOrderingComposer,
          $$HealthCenterTblTableAnnotationComposer,
          $$HealthCenterTblTableCreateCompanionBuilder,
          $$HealthCenterTblTableUpdateCompanionBuilder,
          (
            HealthCenterTblData,
            BaseReferences<
              _$LocalDB,
              $HealthCenterTblTable,
              HealthCenterTblData
            >,
          ),
          HealthCenterTblData,
          PrefetchHooks Function()
        > {
  $$HealthCenterTblTableTableManager(_$LocalDB db, $HealthCenterTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthCenterTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthCenterTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthCenterTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> reviewCount = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<bool> isHospital = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> tileX = const Value.absent(),
                Value<int> tileY = const Value.absent(),
                Value<Uint8List?> picture = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HealthCenterTblCompanion(
                id: id,
                name: name,
                address: address,
                rating: rating,
                reviewCount: reviewCount,
                latitude: latitude,
                longitude: longitude,
                isHospital: isHospital,
                isFavorite: isFavorite,
                tileX: tileX,
                tileY: tileY,
                picture: picture,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String name,
                required String address,
                required double rating,
                required int reviewCount,
                required double latitude,
                required double longitude,
                required bool isHospital,
                required bool isFavorite,
                required int tileX,
                required int tileY,
                Value<Uint8List?> picture = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HealthCenterTblCompanion.insert(
                id: id,
                name: name,
                address: address,
                rating: rating,
                reviewCount: reviewCount,
                latitude: latitude,
                longitude: longitude,
                isHospital: isHospital,
                isFavorite: isFavorite,
                tileX: tileX,
                tileY: tileY,
                picture: picture,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HealthCenterTblTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDB,
      $HealthCenterTblTable,
      HealthCenterTblData,
      $$HealthCenterTblTableFilterComposer,
      $$HealthCenterTblTableOrderingComposer,
      $$HealthCenterTblTableAnnotationComposer,
      $$HealthCenterTblTableCreateCompanionBuilder,
      $$HealthCenterTblTableUpdateCompanionBuilder,
      (
        HealthCenterTblData,
        BaseReferences<_$LocalDB, $HealthCenterTblTable, HealthCenterTblData>,
      ),
      HealthCenterTblData,
      PrefetchHooks Function()
    >;
typedef $$DoctorTblTableCreateCompanionBuilder =
    DoctorTblCompanion Function({
      required int id,
      required String name,
      required String address,
      required double rating,
      required int reviewCount,
      required double latitude,
      required double longitude,
      required bool isFavorite,
      required int tileX,
      required int tileY,
      required int specialty,
      Value<Uint8List?> picture,
      required int patientsCount,
      required int yearsOfExperience,
      required String bio,
      required int dayStartMin,
      required int dayEndMin,
      required int visitDuration,
      required int startDay,
      required int endDay,
      Value<int> rowid,
    });
typedef $$DoctorTblTableUpdateCompanionBuilder =
    DoctorTblCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> address,
      Value<double> rating,
      Value<int> reviewCount,
      Value<double> latitude,
      Value<double> longitude,
      Value<bool> isFavorite,
      Value<int> tileX,
      Value<int> tileY,
      Value<int> specialty,
      Value<Uint8List?> picture,
      Value<int> patientsCount,
      Value<int> yearsOfExperience,
      Value<String> bio,
      Value<int> dayStartMin,
      Value<int> dayEndMin,
      Value<int> visitDuration,
      Value<int> startDay,
      Value<int> endDay,
      Value<int> rowid,
    });

class $$DoctorTblTableFilterComposer
    extends Composer<_$LocalDB, $DoctorTblTable> {
  $$DoctorTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tileX => $composableBuilder(
    column: $table.tileX,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tileY => $composableBuilder(
    column: $table.tileY,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get picture => $composableBuilder(
    column: $table.picture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get patientsCount => $composableBuilder(
    column: $table.patientsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get yearsOfExperience => $composableBuilder(
    column: $table.yearsOfExperience,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayStartMin => $composableBuilder(
    column: $table.dayStartMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayEndMin => $composableBuilder(
    column: $table.dayEndMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get visitDuration => $composableBuilder(
    column: $table.visitDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startDay => $composableBuilder(
    column: $table.startDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endDay => $composableBuilder(
    column: $table.endDay,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DoctorTblTableOrderingComposer
    extends Composer<_$LocalDB, $DoctorTblTable> {
  $$DoctorTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tileX => $composableBuilder(
    column: $table.tileX,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tileY => $composableBuilder(
    column: $table.tileY,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get picture => $composableBuilder(
    column: $table.picture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get patientsCount => $composableBuilder(
    column: $table.patientsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get yearsOfExperience => $composableBuilder(
    column: $table.yearsOfExperience,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayStartMin => $composableBuilder(
    column: $table.dayStartMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayEndMin => $composableBuilder(
    column: $table.dayEndMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get visitDuration => $composableBuilder(
    column: $table.visitDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startDay => $composableBuilder(
    column: $table.startDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endDay => $composableBuilder(
    column: $table.endDay,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DoctorTblTableAnnotationComposer
    extends Composer<_$LocalDB, $DoctorTblTable> {
  $$DoctorTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tileX =>
      $composableBuilder(column: $table.tileX, builder: (column) => column);

  GeneratedColumn<int> get tileY =>
      $composableBuilder(column: $table.tileY, builder: (column) => column);

  GeneratedColumn<int> get specialty =>
      $composableBuilder(column: $table.specialty, builder: (column) => column);

  GeneratedColumn<Uint8List> get picture =>
      $composableBuilder(column: $table.picture, builder: (column) => column);

  GeneratedColumn<int> get patientsCount => $composableBuilder(
    column: $table.patientsCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get yearsOfExperience => $composableBuilder(
    column: $table.yearsOfExperience,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<int> get dayStartMin => $composableBuilder(
    column: $table.dayStartMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dayEndMin =>
      $composableBuilder(column: $table.dayEndMin, builder: (column) => column);

  GeneratedColumn<int> get visitDuration => $composableBuilder(
    column: $table.visitDuration,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startDay =>
      $composableBuilder(column: $table.startDay, builder: (column) => column);

  GeneratedColumn<int> get endDay =>
      $composableBuilder(column: $table.endDay, builder: (column) => column);
}

class $$DoctorTblTableTableManager
    extends
        RootTableManager<
          _$LocalDB,
          $DoctorTblTable,
          DoctorTblData,
          $$DoctorTblTableFilterComposer,
          $$DoctorTblTableOrderingComposer,
          $$DoctorTblTableAnnotationComposer,
          $$DoctorTblTableCreateCompanionBuilder,
          $$DoctorTblTableUpdateCompanionBuilder,
          (
            DoctorTblData,
            BaseReferences<_$LocalDB, $DoctorTblTable, DoctorTblData>,
          ),
          DoctorTblData,
          PrefetchHooks Function()
        > {
  $$DoctorTblTableTableManager(_$LocalDB db, $DoctorTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoctorTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoctorTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoctorTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> reviewCount = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> tileX = const Value.absent(),
                Value<int> tileY = const Value.absent(),
                Value<int> specialty = const Value.absent(),
                Value<Uint8List?> picture = const Value.absent(),
                Value<int> patientsCount = const Value.absent(),
                Value<int> yearsOfExperience = const Value.absent(),
                Value<String> bio = const Value.absent(),
                Value<int> dayStartMin = const Value.absent(),
                Value<int> dayEndMin = const Value.absent(),
                Value<int> visitDuration = const Value.absent(),
                Value<int> startDay = const Value.absent(),
                Value<int> endDay = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoctorTblCompanion(
                id: id,
                name: name,
                address: address,
                rating: rating,
                reviewCount: reviewCount,
                latitude: latitude,
                longitude: longitude,
                isFavorite: isFavorite,
                tileX: tileX,
                tileY: tileY,
                specialty: specialty,
                picture: picture,
                patientsCount: patientsCount,
                yearsOfExperience: yearsOfExperience,
                bio: bio,
                dayStartMin: dayStartMin,
                dayEndMin: dayEndMin,
                visitDuration: visitDuration,
                startDay: startDay,
                endDay: endDay,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String name,
                required String address,
                required double rating,
                required int reviewCount,
                required double latitude,
                required double longitude,
                required bool isFavorite,
                required int tileX,
                required int tileY,
                required int specialty,
                Value<Uint8List?> picture = const Value.absent(),
                required int patientsCount,
                required int yearsOfExperience,
                required String bio,
                required int dayStartMin,
                required int dayEndMin,
                required int visitDuration,
                required int startDay,
                required int endDay,
                Value<int> rowid = const Value.absent(),
              }) => DoctorTblCompanion.insert(
                id: id,
                name: name,
                address: address,
                rating: rating,
                reviewCount: reviewCount,
                latitude: latitude,
                longitude: longitude,
                isFavorite: isFavorite,
                tileX: tileX,
                tileY: tileY,
                specialty: specialty,
                picture: picture,
                patientsCount: patientsCount,
                yearsOfExperience: yearsOfExperience,
                bio: bio,
                dayStartMin: dayStartMin,
                dayEndMin: dayEndMin,
                visitDuration: visitDuration,
                startDay: startDay,
                endDay: endDay,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DoctorTblTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDB,
      $DoctorTblTable,
      DoctorTblData,
      $$DoctorTblTableFilterComposer,
      $$DoctorTblTableOrderingComposer,
      $$DoctorTblTableAnnotationComposer,
      $$DoctorTblTableCreateCompanionBuilder,
      $$DoctorTblTableUpdateCompanionBuilder,
      (
        DoctorTblData,
        BaseReferences<_$LocalDB, $DoctorTblTable, DoctorTblData>,
      ),
      DoctorTblData,
      PrefetchHooks Function()
    >;
typedef $$BookingTableCreateCompanionBuilder =
    BookingCompanion Function({
      required int id,
      required int doctor,
      required DateTime datetime,
      required bool isCanceled,
      Value<int> rowid,
    });
typedef $$BookingTableUpdateCompanionBuilder =
    BookingCompanion Function({
      Value<int> id,
      Value<int> doctor,
      Value<DateTime> datetime,
      Value<bool> isCanceled,
      Value<int> rowid,
    });

class $$BookingTableFilterComposer extends Composer<_$LocalDB, $BookingTable> {
  $$BookingTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get doctor => $composableBuilder(
    column: $table.doctor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get datetime => $composableBuilder(
    column: $table.datetime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCanceled => $composableBuilder(
    column: $table.isCanceled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BookingTableOrderingComposer
    extends Composer<_$LocalDB, $BookingTable> {
  $$BookingTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get doctor => $composableBuilder(
    column: $table.doctor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get datetime => $composableBuilder(
    column: $table.datetime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCanceled => $composableBuilder(
    column: $table.isCanceled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BookingTableAnnotationComposer
    extends Composer<_$LocalDB, $BookingTable> {
  $$BookingTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get doctor =>
      $composableBuilder(column: $table.doctor, builder: (column) => column);

  GeneratedColumn<DateTime> get datetime =>
      $composableBuilder(column: $table.datetime, builder: (column) => column);

  GeneratedColumn<bool> get isCanceled => $composableBuilder(
    column: $table.isCanceled,
    builder: (column) => column,
  );
}

class $$BookingTableTableManager
    extends
        RootTableManager<
          _$LocalDB,
          $BookingTable,
          BookingData,
          $$BookingTableFilterComposer,
          $$BookingTableOrderingComposer,
          $$BookingTableAnnotationComposer,
          $$BookingTableCreateCompanionBuilder,
          $$BookingTableUpdateCompanionBuilder,
          (BookingData, BaseReferences<_$LocalDB, $BookingTable, BookingData>),
          BookingData,
          PrefetchHooks Function()
        > {
  $$BookingTableTableManager(_$LocalDB db, $BookingTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> doctor = const Value.absent(),
                Value<DateTime> datetime = const Value.absent(),
                Value<bool> isCanceled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookingCompanion(
                id: id,
                doctor: doctor,
                datetime: datetime,
                isCanceled: isCanceled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required int doctor,
                required DateTime datetime,
                required bool isCanceled,
                Value<int> rowid = const Value.absent(),
              }) => BookingCompanion.insert(
                id: id,
                doctor: doctor,
                datetime: datetime,
                isCanceled: isCanceled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BookingTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDB,
      $BookingTable,
      BookingData,
      $$BookingTableFilterComposer,
      $$BookingTableOrderingComposer,
      $$BookingTableAnnotationComposer,
      $$BookingTableCreateCompanionBuilder,
      $$BookingTableUpdateCompanionBuilder,
      (BookingData, BaseReferences<_$LocalDB, $BookingTable, BookingData>),
      BookingData,
      PrefetchHooks Function()
    >;
typedef $$UnreadNotificationsTblTableCreateCompanionBuilder =
    UnreadNotificationsTblCompanion Function({
      required int id,
      required String title,
      required String desc,
      required DateTime timestamp,
      Value<int?> icon,
      Value<int> rowid,
    });
typedef $$UnreadNotificationsTblTableUpdateCompanionBuilder =
    UnreadNotificationsTblCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> desc,
      Value<DateTime> timestamp,
      Value<int?> icon,
      Value<int> rowid,
    });

class $$UnreadNotificationsTblTableFilterComposer
    extends Composer<_$LocalDB, $UnreadNotificationsTblTable> {
  $$UnreadNotificationsTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnreadNotificationsTblTableOrderingComposer
    extends Composer<_$LocalDB, $UnreadNotificationsTblTable> {
  $$UnreadNotificationsTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnreadNotificationsTblTableAnnotationComposer
    extends Composer<_$LocalDB, $UnreadNotificationsTblTable> {
  $$UnreadNotificationsTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);
}

class $$UnreadNotificationsTblTableTableManager
    extends
        RootTableManager<
          _$LocalDB,
          $UnreadNotificationsTblTable,
          UnreadNotificationsTblData,
          $$UnreadNotificationsTblTableFilterComposer,
          $$UnreadNotificationsTblTableOrderingComposer,
          $$UnreadNotificationsTblTableAnnotationComposer,
          $$UnreadNotificationsTblTableCreateCompanionBuilder,
          $$UnreadNotificationsTblTableUpdateCompanionBuilder,
          (
            UnreadNotificationsTblData,
            BaseReferences<
              _$LocalDB,
              $UnreadNotificationsTblTable,
              UnreadNotificationsTblData
            >,
          ),
          UnreadNotificationsTblData,
          PrefetchHooks Function()
        > {
  $$UnreadNotificationsTblTableTableManager(
    _$LocalDB db,
    $UnreadNotificationsTblTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnreadNotificationsTblTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$UnreadNotificationsTblTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UnreadNotificationsTblTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> desc = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int?> icon = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnreadNotificationsTblCompanion(
                id: id,
                title: title,
                desc: desc,
                timestamp: timestamp,
                icon: icon,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String title,
                required String desc,
                required DateTime timestamp,
                Value<int?> icon = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnreadNotificationsTblCompanion.insert(
                id: id,
                title: title,
                desc: desc,
                timestamp: timestamp,
                icon: icon,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnreadNotificationsTblTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDB,
      $UnreadNotificationsTblTable,
      UnreadNotificationsTblData,
      $$UnreadNotificationsTblTableFilterComposer,
      $$UnreadNotificationsTblTableOrderingComposer,
      $$UnreadNotificationsTblTableAnnotationComposer,
      $$UnreadNotificationsTblTableCreateCompanionBuilder,
      $$UnreadNotificationsTblTableUpdateCompanionBuilder,
      (
        UnreadNotificationsTblData,
        BaseReferences<
          _$LocalDB,
          $UnreadNotificationsTblTable,
          UnreadNotificationsTblData
        >,
      ),
      UnreadNotificationsTblData,
      PrefetchHooks Function()
    >;

class $LocalDBManager {
  final _$LocalDB _db;
  $LocalDBManager(this._db);
  $$ClientSessionTblTableTableManager get clientSessionTbl =>
      $$ClientSessionTblTableTableManager(_db, _db.clientSessionTbl);
  $$HealthCenterTblTableTableManager get healthCenterTbl =>
      $$HealthCenterTblTableTableManager(_db, _db.healthCenterTbl);
  $$DoctorTblTableTableManager get doctorTbl =>
      $$DoctorTblTableTableManager(_db, _db.doctorTbl);
  $$BookingTableTableManager get booking =>
      $$BookingTableTableManager(_db, _db.booking);
  $$UnreadNotificationsTblTableTableManager get unreadNotificationsTbl =>
      $$UnreadNotificationsTblTableTableManager(
        _db,
        _db.unreadNotificationsTbl,
      );
}
