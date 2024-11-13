class Address {
  final String title;
  final double latitude;
  final double longitude;

  Address({required this.title, required this.latitude, required this.longitude});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      title: json['title'],
      latitude: json['position']['lat'],
      longitude: json['position']['lng'],
    );
  }
}
