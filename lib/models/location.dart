class Location {
  double latitude;
  double longitude;

  Location({
    this.latitude = 0,
    this.longitude = 0,
  });

  factory Location.createLocation(Map<String, dynamic> map) {
    return Location(
      latitude: map['latitude'] ?? 0,
      longitude: map['longitude'] ?? 0,
    );
  }
}
