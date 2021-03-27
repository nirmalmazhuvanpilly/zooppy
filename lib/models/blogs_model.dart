// To parse this JSON data, do
//
//     final blogsModel = blogsModelFromJson(jsonString);

import 'dart:convert';

BlogsModel blogsModelFromJson(String str) =>
    BlogsModel.fromJson(json.decode(str));

String blogsModelToJson(BlogsModel data) => json.encode(data.toJson());

class BlogsModel {
  BlogsModel({
    this.filmIndustries,
    this.blogs,
    this.noCategoryText,
    this.noIndustryText,
  });

  List<dynamic> filmIndustries;
  Blogs blogs;
  String noCategoryText;
  String noIndustryText;

  factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
        filmIndustries:
            List<dynamic>.from(json["film_industries"].map((x) => x)),
        blogs: Blogs.fromJson(json["blogs"]),
        noCategoryText: json["no_category_text"],
        noIndustryText: json["no_industry_text"],
      );

  Map<String, dynamic> toJson() => {
        "film_industries": List<dynamic>.from(filmIndustries.map((x) => x)),
        "blogs": blogs.toJson(),
        "no_category_text": noCategoryText,
        "no_industry_text": noIndustryText,
      };
}

class Blogs {
  Blogs({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Blogs.fromJson(Map<String, dynamic> json) => Blogs(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.body,
    this.metaTitle,
    this.metaDescription,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.visible,
    this.order,
    this.filmIndustryId,
    this.categoryId,
    this.image,
    this.images,
    this.metaImage,
    this.filmIndustry,
    this.category,
    this.media,
  });

  int id;
  String title;
  String body;
  dynamic metaTitle;
  dynamic metaDescription;
  String createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int visible;
  int order;
  int filmIndustryId;
  int categoryId;
  String image;
  String images;
  String metaImage;
  FilmIndustry filmIndustry;
  Category category;
  List<Media> media;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        visible: json["visible"],
        order: json["order"],
        filmIndustryId: json["film_industry_id"],
        categoryId: json["category_id"],
        image: json["image"],
        images: json["images"],
        metaImage: json["meta_image"],
        filmIndustry: json["film_industry"] == null
            ? null
            : FilmIndustry.fromJson(json["film_industry"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "visible": visible,
        "order": order,
        "film_industry_id": filmIndustryId,
        "category_id": categoryId,
        "image": image,
        "images": images,
        "meta_image": metaImage,
        "film_industry": filmIndustry == null ? null : filmIndustry.toJson(),
        "category": category == null ? null : category.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class FilmIndustry {
  FilmIndustry({
    this.id,
    this.name,
    this.deletedAt,
  });

  int id;
  String name;
  dynamic deletedAt;

  factory FilmIndustry.fromJson(Map<String, dynamic> json) => FilmIndustry(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
      };
}

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
  ModelType modelType;
  int modelId;
  CollectionName collectionName;
  String name;
  String fileName;
  MimeType mimeType;
  Disk disk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: modelTypeValues.map[json["model_type"]],
        modelId: json["model_id"],
        collectionName: collectionNameValues.map[json["collection_name"]],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        disk: diskValues.map[json["disk"]],
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
        "model_type": modelTypeValues.reverse[modelType],
        "model_id": modelId,
        "collection_name": collectionNameValues.reverse[collectionName],
        "name": name,
        "file_name": fileName,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "disk": diskValues.reverse[disk],
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum CollectionName { BLOG_IMAGE }

final collectionNameValues =
    EnumValues({"blog_image": CollectionName.BLOG_IMAGE});

enum Disk { S3 }

final diskValues = EnumValues({"s3": Disk.S3});

enum MimeType { IMAGE_JPEG, IMAGE_WEBP }

final mimeTypeValues = EnumValues(
    {"image/jpeg": MimeType.IMAGE_JPEG, "image/webp": MimeType.IMAGE_WEBP});

enum ModelType { APP_MODELS_BLOG }

final modelTypeValues =
    EnumValues({"App\\Models\\Blog": ModelType.APP_MODELS_BLOG});

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
