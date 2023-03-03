class WishListModel {
  int? status;
  String? message;
  Data? data;

  WishListModel({this.status, this.message, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<WishList>? wishList;

  Data({this.wishList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['wish_list'] != null) {
      wishList = <WishList>[];
      json['wish_list'].forEach((v) {
        wishList!.add(new WishList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wishList != null) {
      data['wish_list'] = this.wishList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishList {
  int? id;
  int? userId;
  int? productId;
  String? createdAt;
  String? updatedAt;

  WishList(
      {this.id, this.userId, this.productId, this.createdAt, this.updatedAt});

  WishList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}