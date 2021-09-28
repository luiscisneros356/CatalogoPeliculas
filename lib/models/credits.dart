import 'dart:convert';

class Credits {
  Credits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int? id;
  List<Cast>? cast;
  List<Cast>? crew;

  factory Credits.fromJson(String str) => Credits.fromMap(json.decode(str));

  factory Credits.fromMap(Map<String, dynamic> json) => Credits(
        id: json["id"] == null ? null : json["id"],
        cast: json["cast"] == null
            ? null
            : List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: json["crew"] == null
            ? null
            : List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );
}

class Cast {
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.job,
  });

  bool? adult;
  int? gender;
  int? id;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? job;

  get fullpProfilePath {
    if (profilePath != null) {
      return "https://image.tmdb.org/t/p/w500$profilePath";
    }
    return "https://i.stack.imgur.com/GNhxO.png";
  }

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"] == null ? null : json["adult"],
        gender: json["gender"] == null ? null : json["gender"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        job: json["job"] == null ? null : json["job"],
      );
}
