class Location {
  String latitude;
  String longitude;

  Location({
    this.latitude = "",
    this.longitude = "",
  });

  factory Location.createLocation(Map<String, dynamic> map) {
    return Location(
      latitude: map['latitude'] ?? "",
      longitude: map['longitude'] ?? "",
    );
  }
}
