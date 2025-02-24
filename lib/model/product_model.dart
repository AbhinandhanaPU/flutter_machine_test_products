class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions? dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta? meta;
  final List<String> images;
  final String thumbnail;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      price: (json["price"] as num).toDouble(),
      discountPercentage: (json["discountPercentage"] as num).toDouble(),
      rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
      stock: json["stock"] ?? 0,
      tags: json["tags"] == null
          ? []
          : List<String>.from(json["tags"].map((x) => x.toString())),
      brand: json["brand"] ?? "",
      sku: json["sku"] ?? "",
      weight: json["weight"] ?? 0,
      dimensions: json["dimensions"] == null
          ? null
          : Dimensions.fromJson(json["dimensions"]),
      warrantyInformation: json["warrantyInformation"] ?? "",
      shippingInformation: json["shippingInformation"] ?? "",
      availabilityStatus: json["availabilityStatus"] ?? "",
      reviews: json["reviews"] == null
          ? []
          : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      returnPolicy: json["returnPolicy"] ?? "",
      minimumOrderQuantity: json["minimumOrderQuantity"] ?? 0,
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"].map((x) => x.toString())),
      thumbnail: json["thumbnail"] ?? "",
    );
  }
}

class Dimensions {
  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  final double width;
  final double height;
  final double depth;

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json["width"] as num?)?.toDouble() ?? 0.0,
      height: (json["height"] as num?)?.toDouble() ?? 0.0,
      depth: (json["depth"] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class Meta {
  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String barcode;
  final String qrCode;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      barcode: json["barcode"] ?? "",
      qrCode: json["qrCode"] ?? "",
    );
  }
}

class Review {
  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  final int rating;
  final String comment;
  final DateTime? date;
  final String reviewerName;
  final String reviewerEmail;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: (json["rating"] as num?)?.toInt() ?? 0,
      comment: json["comment"] ?? "",
      date: DateTime.tryParse(json["date"] ?? ""),
      reviewerName: json["reviewerName"] ?? "",
      reviewerEmail: json["reviewerEmail"] ?? "",
    );
  }
}
