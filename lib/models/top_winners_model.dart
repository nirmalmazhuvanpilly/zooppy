// To parse this JSON data, do
//
//     final topWinnersModel = topWinnersModelFromJson(jsonString);

import 'dart:convert';

TopWinnersModel topWinnersModelFromJson(String str) =>
    TopWinnersModel.fromJson(json.decode(str));

String topWinnersModelToJson(TopWinnersModel data) =>
    json.encode(data.toJson());

class TopWinnersModel {
  TopWinnersModel({
    this.success,
    this.userWinnings,
    this.topWinners,
  });

  bool success;
  dynamic userWinnings;
  List<TopWinner> topWinners;

  factory TopWinnersModel.fromJson(Map<String, dynamic> json) =>
      TopWinnersModel(
        success: json["success"],
        userWinnings: json["user_winnings"],
        topWinners: List<TopWinner>.from(
            json["top_winners"].map((x) => TopWinner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "user_winnings": userWinnings,
        "top_winners": List<dynamic>.from(topWinners.map((x) => x.toJson())),
      };
}

class TopWinner {
  TopWinner({
    this.id,
    this.userId,
    this.type,
    this.rank,
    this.totalWinnings,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int id;
  int userId;
  TopWinnerType type;
  int rank;
  int totalWinnings;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory TopWinner.fromJson(Map<String, dynamic> json) => TopWinner(
        id: json["id"],
        userId: json["user_id"],
        type: topWinnerTypeValues.map[json["type"]],
        rank: json["rank"],
        totalWinnings: json["total_winnings"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": topWinnerTypeValues.reverse[type],
        "rank": rank,
        "total_winnings": totalWinnings,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

enum TopWinnerType { ALL_TIME }

final topWinnerTypeValues = EnumValues({"all_time": TopWinnerType.ALL_TIME});

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.type,
    this.emailVerifiedAt,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.mobileNumber,
    this.username,
    this.gender,
    this.dateOfBirth,
    this.pan,
    this.city,
    this.state,
    this.panVerifiedAt,
    this.referredBy,
    this.avatarId,
    this.languageId,
    this.image,
    this.panImage,
    this.avatar,
    this.media,
  });

  int id;
  String name;
  String email;
  UserType type;
  DateTime emailVerifiedAt;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;
  String mobileNumber;
  dynamic username;
  Gender gender;
  DateTime dateOfBirth;
  String pan;
  dynamic city;
  String state;
  DateTime panVerifiedAt;
  int referredBy;
  int avatarId;
  int languageId;
  String image;
  String panImage;
  Avatar avatar;
  List<Media> media;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"] == null ? null : json["email"],
        type: userTypeValues.map[json["type"]],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        mobileNumber: json["mobile_number"],
        username: json["username"],
        gender:
            json["gender"] == null ? null : genderValues.map[json["gender"]],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        pan: json["pan"] == null ? null : json["pan"],
        city: json["city"],
        state: json["state"] == null ? null : json["state"],
        panVerifiedAt: json["pan_verified_at"] == null
            ? null
            : DateTime.parse(json["pan_verified_at"]),
        referredBy: json["referred_by"] == null ? null : json["referred_by"],
        avatarId: json["avatar_id"],
        languageId: json["language_id"],
        image: json["image"],
        panImage: json["pan_image"],
        avatar: Avatar.fromJson(json["avatar"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email == null ? null : email,
        "type": userTypeValues.reverse[type],
        "email_verified_at":
            emailVerifiedAt == null ? null : emailVerifiedAt.toIso8601String(),
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "mobile_number": mobileNumber,
        "username": username,
        "gender": gender == null ? null : genderValues.reverse[gender],
        "date_of_birth": dateOfBirth == null
            ? null
            : "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "pan": pan == null ? null : pan,
        "city": city,
        "state": state == null ? null : state,
        "pan_verified_at":
            panVerifiedAt == null ? null : panVerifiedAt.toIso8601String(),
        "referred_by": referredBy == null ? null : referredBy,
        "avatar_id": avatarId,
        "language_id": languageId,
        "image": image,
        "pan_image": panImage,
        "avatar": avatar.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Avatar {
  Avatar({
    this.id,
    this.name,
    this.image,
  });

  int id;
  String name;
  String image;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

class Media {
  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String modelType;
  int modelId;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  String disk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties:
            List<dynamic>.from(json["custom_properties"].map((x) => x)),
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum UserType { DEFAULT }

final userTypeValues = EnumValues({"default": UserType.DEFAULT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
