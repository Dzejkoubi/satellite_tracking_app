class Event {
  // Constructor
  Event(
      {required this.altitute,
      required this.azimuth,
      required this.azimuthOctant,
      required this.utcDateTime,
      required this.utcTimestamp,
      required this.isSunlit,
      required this.visible});

  // Properties
  final String altitute;
  final String azimuth;
  final String azimuthOctant;
  final String utcDateTime;
  final int utcTimestamp;
  final bool isSunlit;
  final bool visible;

  // Methods
  factory Event.fromJson(Map<String, dynamic> json) {
    // Convert from JSON
    return Event(
        altitute: json['alt'],
        azimuth: json['az'],
        azimuthOctant: json['az_octant'],
        utcDateTime: json['utc_datetime'],
        utcTimestamp: json['utc_timestamp'],
        isSunlit: json['is_sunlit'],
        visible: json['visible']);
  }
  Map<String, dynamic> toJson() {
    // Convert to JSON
    return {
      "alt": altitute,
      "az": azimuth,
      "az_octant": azimuthOctant,
      "utc_datetime": utcDateTime,
      "utc_timestamp": utcTimestamp,
      "is_sunlit": isSunlit,
      "visible": visible
    };
  }
}

class SatellitePass {
  // Constructor
  SatellitePass(
      {required this.rise,
      required this.culmination,
      required this.set,
      required this.isVisible,
      required this.noradId});

  // Properties
  final Event rise;
  final Event culmination;
  final Event set;
  final bool isVisible;
  final int noradId;

  // Methods
  factory SatellitePass.fromJson(Map<String, dynamic> json) {
    // Convert from JSON

    return SatellitePass(
      rise: Event.fromJson(json["rise"]),
      culmination: Event.fromJson(json["culmination"]),
      set: Event.fromJson(json["set"]),
      isVisible: json["visible"],
      noradId: json["norad_id"],
    );
  }

  Map<String, dynamic> toJson() {
    // Convert to JSON

    return {
      "rise": rise.toJson(),
      "culmination": culmination.toJson(),
      "set": set.toJson(),
      "visible": isVisible,
      "norad_id": noradId,
    };
  }
}

class SatelliteData {
  // Constructor
  SatelliteData({required this.passes});
  // Properties
  final List<SatellitePass> passes;

  factory SatelliteData.fromJson(List<dynamic> jsonList) {
    return SatelliteData(
        passes: jsonList.map((json) => SatellitePass.fromJson(json)).toList());
  }
  List<Map<String, dynamic>> toJson() {
    return passes.map((pass) => pass.toJson()).toList();
  }
}


// {
// "rise": {
// "alt": "10.04",
// "az": "281.59",
// "az_octant": "W",
// "utc_datetime": "2024-11-12 00:01:49.321771+00:00",
// "utc_timestamp": 1731369709,
// "is_sunlit": false,
// "visible": false
// },
// "culmination": {
// "alt": "46.06",
// "az": "207.37",
// "az_octant": "SW",
// "utc_datetime": "2024-11-12 00:05:01.258408+00:00",
// "utc_timestamp": 1731369901,
// "is_sunlit": false,
// "visible": false
// },
// "set": {
// "alt": "9.88",
// "az": "133.00",
// "az_octant": "SE",
// "utc_datetime": "2024-11-12 00:08:13.175774+00:00",
// "utc_timestamp": 1731370093,
// "is_sunlit": false,
// "visible": false
// },
// "visible": false,
// "norad_id": 25544
// },