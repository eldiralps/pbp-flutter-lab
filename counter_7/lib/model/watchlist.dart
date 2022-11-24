import 'dart:convert';

List<Watchlist> watchlistFromJson(String str) => List<Watchlist>.from(
    json.decode(str).map((watchlist) => Watchlist.fromJson(watchlist)));
String watchlistToJson(List<Watchlist> data) => json
    .encode(List<dynamic>.from(data.map((watchlist) => watchlist.toJson())));

class Watchlist {
  Watchlist({
    required this.id,
    required this.watched,
    required this.title,
    required this.rating,
    required this.release_date,
    required this.review,
  });

  int id;
  String watched;
  String title;
  int rating;
  String release_date;
  String review;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        id: json["id"],
        watched: json["fields"]["watched"],
        title: json["fields"]["title"],
        rating: json["fields"]["rating"],
        release_date: json["fields"]["release_date"],
        review: json["fields"]["review"],
      );

  Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date": release_date,
        "review": review,
      };
}

// To parse this JSON data, do
//
//     final watchlist = watchlistFromJson(jsonString);

// import 'dart:convert';

// List<Watchlist> watchlistFromJson(String str) =>
//     List<Watchlist>.from(json.decode(str).map((x) => Watchlist.fromJson(x)));

// String watchlistToJson(List<Watchlist> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Watchlist {
//   Watchlist({
//     required this.model,
//     required this.pk,
//     required this.fields,
//   });

//   Model model;
//   int pk;
//   Fields fields;

//   factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
//         model: json["model"],
//         pk: json["pk"],
//         fields: Fields.fromJson(json["fields"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "model": modelValues.reverse[model],
//         "pk": pk,
//         "fields": fields.toJson(),
//       };
// }

// class Fields {
//   Fields({
//     required this.watched,
//     required this.title,
//     required this.rating,
//     required this.releaseDate,
//     required this.review,
//   });

//   Watched watched;
//   String title;
//   int rating;
//   String releaseDate;
//   String review;

//   factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//         watched: json["watched"],
//         title: json["title"],
//         rating: json["rating"],
//         releaseDate: json["release_date"],
//         review: json["review"],
//       );

//   Map<String, dynamic> toJson() => {
//         "watched": watchedValues.reverse[watched],
//         "title": title,
//         "rating": rating,
//         "release_date": releaseDate,
//         "review": review,
//       };
// }

// enum Watched { YES, NOT_YET }

// final watchedValues =
//     EnumValues({"Not yet": Watched.NOT_YET, "Yes": Watched.YES});

// enum Model { MYWATCHLIST_MYWATCHLIST }

// final modelValues =
//     EnumValues({"mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
