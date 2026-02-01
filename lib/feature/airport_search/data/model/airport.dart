class Airport {
  final String code;
  final String city;
  final String name;
  final String country;

  Airport({
    required this.code,
    required this.city,
    required this.name,
    required this.country,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      code: json['code'],
      city: json['city']['name'],
      name: json['name'],
      country: json['city']['country']['name'],
    );
  }
}
