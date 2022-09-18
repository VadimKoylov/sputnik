class UserModel {
  UserModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.name,
    required this.company,
    required this.email,
    required this.bio,
  });

  String login;
  int id;
  String? avatarUrl;
  String? url;
  String? name;
  String? company;
  String? email;
  String? bio;


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    login: json['login'],
    id: json['id'],
    avatarUrl: json['avatar_url'],
    name: json['name'],
    company: json['company'],
    email: json['email'],
    bio: json['bio'],
  );

  Map<String, dynamic> toJson() => {
    'login': login,
    'id': id,
    'avatar_url': avatarUrl,
    'url': url,
    'name': name,
    'company': company,
    'email': email,
    'bio': bio,
  };
}