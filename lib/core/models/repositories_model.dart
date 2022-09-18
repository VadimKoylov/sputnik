class RepositoriesModel {
  RepositoriesModel({
    required this.id,
    required this.name,
    required this.stargazersCount,
    required this.forks,
  });

  int id;
  String? name;
  int? stargazersCount;
  int? forks;

  factory RepositoriesModel.fromJson(Map<String, dynamic> json) => RepositoriesModel(
    id: json['id'],
    name: json['name'],
    stargazersCount: json['stargazers_count'],
    forks: json['forks'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'stargazers_count': stargazersCount,
    'forks': forks,
  };
}