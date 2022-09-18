class FollowingModel {
  FollowingModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  String login;
  int id;
  String avatarUrl;

  factory FollowingModel.fromJson(Map<String, dynamic> json) => FollowingModel(
    login: json['login'],
    id: json['id'],
    avatarUrl: json['avatar_url'],
  );

  Map<String, dynamic> toJson() => {
    'login': login,
    'id': id,
    'avatar_url': avatarUrl,
  };
}
