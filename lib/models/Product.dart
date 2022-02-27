
class Product {
  int productId;
  String productName;
  String description;
  String category;
  String subCategory;
  String uom;
  double price;
  String weight;
  String size;
  int productRank;
  String productImage;
  String brand;
  String productCode;
  bool disclosePrice;
  String alterPriceText;
  double pointsToEarn;

  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.category,
    required this.subCategory,
    required this.uom,
    required this.price,
    required this.weight,
    required this.size,
    required this.productRank,
    required this.productImage,
    required this.brand,
    required this.productCode,
    required this.disclosePrice,
    required this.alterPriceText,
    required this.pointsToEarn,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_iD"],
        productName: json["product_name"],
        description: json["description"],
        category: json["category"],
        subCategory: json["sub_Category"],
        uom: json["uom"],
        price: json["price"],
        weight: json["weight"],
        size: json["size"],
        productRank: json["product_rank"],
        productImage: json["product_image"],
        brand: json["brand"],
        productCode: json["product_code"],
        disclosePrice: json["disclose_price"],
        alterPriceText: json["alter_price_text"],
        pointsToEarn: json["points_to_earn"],
      );

  Map<String, dynamic> toJson() => {
        "product_iD": productId,
        "product_name": productName,
        "description": description,
        "category": category,
        "sub_Category": subCategory,
        "uom": uom,
        "price": price,
        "weight": weight,
        "size": size,
        "product_rank": productRank,
        "product_image": productImage,
        "brand": brand,
        "product_code": productCode,
        "disclose_price": disclosePrice,
        "alter_price_text": alterPriceText,
        "points_to_earn": pointsToEarn,
      };
}
