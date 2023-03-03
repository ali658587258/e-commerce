class ProductsModel {
  int? status;
  String? message;
  List<Product>? product;

  ProductsModel({this.status, this.message, this.product});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      product = <Product>[];
      json['data'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.product != null) {
      data['data'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? categoryName;
  String? name;
  int? price;
  int? qty;
  String? image;
  int? offer;
  bool ?isFavourite;

  Product(
      {this.isFavourite=false,
        this.id,
        this.categoryName,
        this.name,
        this.price,
        this.qty,
        this.image,
        this.offer});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category name'];
    name = json['name'];
    price = json['price'];
    qty = json['qty'];
    image = json['image'];
    offer = json['offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category name'] = this.categoryName;
    data['name'] = this.name;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['image'] = this.image;
    data['offer'] = this.offer;
    return data;
  }
}