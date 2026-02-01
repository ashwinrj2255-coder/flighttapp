class RouteElement {
  final String? id;
  final String? combinationId;
  final String? flyFrom;
  final String? flyTo;
  final String? cityFrom;
  final String? cityTo;
  final String? cityCodeFrom;
  final String? cityCodeTo;
  final String? airline;
  final int? flightNo;
  final String? fareCategory;
  final DateTime? localDeparture;
  final DateTime? localArrival;
  final DateTime? utcDeparture;
  final DateTime? utcArrival;
  final int? returnFlight; // 0 for Outbound, 1 for Return

  RouteElement({
    this.id,
    this.combinationId,
    this.flyFrom,
    this.flyTo,
    this.cityFrom,
    this.cityTo,
    this.cityCodeFrom,
    this.cityCodeTo,
    this.airline,
    this.flightNo,
    this.fareCategory,
    this.localDeparture,
    this.localArrival,
    this.utcDeparture,
    this.utcArrival,
    this.returnFlight,
  });

  factory RouteElement.fromJson(Map<String, dynamic> json) => RouteElement(
    id: json["id"],
    combinationId: json["combination_id"],
    flyFrom: json["flyFrom"],
    flyTo: json["flyTo"],
    cityFrom: json["cityFrom"],
    cityTo: json["cityTo"],
    cityCodeFrom: json["cityCodeFrom"],
    cityCodeTo: json["cityCodeTo"],
    airline: json["airline"],
    flightNo: json["flight_no"],
    fareCategory: json["fare_category"],
    // Parsing dates safely
    localDeparture: json["local_departure"] == null
        ? null
        : DateTime.parse(json["local_departure"]),
    localArrival: json["local_arrival"] == null
        ? null
        : DateTime.parse(json["local_arrival"]),
    utcDeparture: json["utc_departure"] == null
        ? null
        : DateTime.parse(json["utc_departure"]),
    utcArrival: json["utc_arrival"] == null
        ? null
        : DateTime.parse(json["utc_arrival"]),
    // In Kiwi API, this field is usually named 'return'
    returnFlight: json["return"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "combination_id": combinationId,
    "flyFrom": flyFrom,
    "flyTo": flyTo,
    "cityFrom": cityFrom,
    "cityTo": cityTo,
    "cityCodeFrom": cityCodeFrom,
    "cityCodeTo": cityCodeTo,
    "airline": airline,
    "flight_no": flightNo,
    "fare_category": fareCategory,
    "local_departure": localDeparture?.toIso8601String(),
    "local_arrival": localArrival?.toIso8601String(),
    "utc_departure": utcDeparture?.toIso8601String(),
    "utc_arrival": utcArrival?.toIso8601String(),
    "return": returnFlight,
  };
}