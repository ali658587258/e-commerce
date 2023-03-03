class CompanyProfileRespond {
  int? status;
  String? message;
  List<Data>? data;

  CompanyProfileRespond({this.status, this.message, this.data});

  CompanyProfileRespond.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? phone;
  String? logo;
  Null? facebook;
  Null? instagram;

  Data(
      {this.name,
      this.email,
      this.phone,
      this.logo,
      this.facebook,
      this.instagram});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    logo = json['logo'];
    facebook = json['facebook'];
    instagram = json['instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['logo'] = this.logo;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    return data;
  }
}
