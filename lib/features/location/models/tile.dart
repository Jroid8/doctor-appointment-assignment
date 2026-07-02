class MapTile {
  final int x;
  final int y;

  const MapTile(this.x, this.y);

  @override
  String toString() {
    return "Tile($x, $y)";
  }

  MapTile.fromJson(Map<String, dynamic> json) : x = json["x"], y = json["y"];
}
