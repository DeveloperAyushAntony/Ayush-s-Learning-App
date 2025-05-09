class AgoraModel {
  final String token;

  AgoraModel({
    required this.token,
  });

  factory AgoraModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AgoraModel(
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"token": token};
  }
}
