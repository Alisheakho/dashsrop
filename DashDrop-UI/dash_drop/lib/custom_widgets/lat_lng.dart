
class LatLng1 {
  const LatLng1(this.latitude, this.longitude);
  final double latitude;
  final double longitude;

  @override
  String toString() => 'LatLng1(lat: $latitude, lng: $longitude)';

  String serialize() => '$latitude,$longitude';

  @override
  int get hashCode => latitude.hashCode + longitude.hashCode;

  @override
  bool operator ==(other) =>
      other is LatLng1 &&
      latitude == other.latitude &&
      longitude == other.longitude;

  factory LatLng1.fromJson(Map<String, dynamic> json) {
    return LatLng1(
      json['lat'] as double,
      json['lng'] as double,
    );
  }

  factory LatLng1.fromString(String str) {
    final parts = str.split(',');
    if (parts.length != 2) {
      throw FormatException('Invalid string format. Expected "latitude,longitude"');
    }
    
    final latitude = double.tryParse(parts[0]);
    final longitude = double.tryParse(parts[1]);
    
    if (latitude == null || longitude == null) {
      throw FormatException('Invalid latitude or longitude value');
    }
    
    return LatLng1(latitude, longitude);
  }
}
