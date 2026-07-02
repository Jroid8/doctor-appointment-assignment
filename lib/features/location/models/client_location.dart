import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:latlong2/latlong.dart';

class ClientLocation {
  final LatLng position;
  final String? label;

  const ClientLocation(this.position, [this.label]);

  static ClientLocation? fromLocalTable(ClientSessionTblData data) =>
      data.latitude == null && data.longitude == null
      ? null
      : ClientLocation(
          LatLng(data.latitude!, data.longitude!),
          data.locationLabel,
        );
}
