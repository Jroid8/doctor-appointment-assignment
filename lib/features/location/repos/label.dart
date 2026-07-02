import 'package:dio/dio.dart';
import 'package:doctor_appointment/common/exceptions/invalid_server_response.dart';
import 'package:doctor_appointment/common/singletons/server_conn.dart';
import 'package:latlong2/latlong.dart';

abstract class LocationLabelRepo {
  Future<String> getLabel(LatLng location);
}

class RemoteLocationLabelRepo implements LocationLabelRepo {
  final ServerConn _conn;

  RemoteLocationLabelRepo(this._conn);

  @override
  Future<String> getLabel(LatLng location) async {
    Response res = await _conn.dio.get(
      "/location/title",
      queryParameters: {"lat": location.latitude, "lng": location.longitude},
      options: Options(validateStatus: (_) => true, responseType: .plain),
    );
    if (res.statusCode == 200) {
      if (res.data is String) {
        return res.data;
      } else {
        throw InvalidServerResponse("Response content not plain text");
      }
    } else {
      throw InvalidServerResponse.fromStatusCode(res.statusCode);
    }
  }
}

class MockLocationLabelRepo implements LocationLabelRepo {
  @override
  Future<String> getLabel(LatLng location) async {
    return "New York, USA";
  }
}
