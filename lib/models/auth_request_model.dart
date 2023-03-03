class AuthRequestModel {
  String token;
  AuthRequestModel({
    required this.token,
  });
  factory AuthRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthRequestModel(
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
