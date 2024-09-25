// To parse this JSON data, do
//
//     final moives = moivesFromJson(jsonString);

import 'dart:convert';

Movies moivesFromJson(String str) => Movies.fromJson(json.decode(str));

String moivesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  String? total;
  int? page;
  int? pages;
  List<TvShow>? tvShows;

  Movies({
    this.total,
    this.page,
    this.pages,
    this.tvShows,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
    total: json["total"],
    page: json["page"],
    pages: json["pages"],
    tvShows: json["tv_shows"] == null ? [] : List<TvShow>.from(json["tv_shows"]!.map((x) => TvShow.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "pages": pages,
    "tv_shows": tvShows == null ? [] : List<dynamic>.from(tvShows!.map((x) => x.toJson())),
  };
}

class TvShow {
  int? id;
  String? name;
  String? permalink;
  DateTime? startDate;
  dynamic endDate;
  Country? country;
  String? network;
  Status? status;
  String? imageThumbnailPath;

  TvShow({
    this.id,
    this.name,
    this.permalink,
    this.startDate,
    this.endDate,
    this.country,
    this.network,
    this.status,
    this.imageThumbnailPath,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
    id: json["id"],
    name: json["name"],
    permalink: json["permalink"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"],
    country: countryValues.map[json["country"]]!,
    network: json["network"],
    status: statusValues.map[json["status"]]!,
    imageThumbnailPath: json["image_thumbnail_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "permalink": permalink,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": endDate,
    "country": countryValues.reverse[country],
    "network": network,
    "status": statusValues.reverse[status],
    "image_thumbnail_path": imageThumbnailPath,
  };
}

enum Country {
  CA,
  JP,
  UK,
  US
}

final countryValues = EnumValues({
  "CA": Country.CA,
  "JP": Country.JP,
  "UK": Country.UK,
  "US": Country.US
});

enum Status {
  ENDED,
  RUNNING
}

final statusValues = EnumValues({
  "Ended": Status.ENDED,
  "Running": Status.RUNNING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
