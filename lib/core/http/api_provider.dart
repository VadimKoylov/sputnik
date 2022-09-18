import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sputnik/core/models/follower_model.dart';
import 'package:sputnik/core/models/following_model.dart';
import 'package:sputnik/core/models/repositories_model.dart';
import 'package:sputnik/core/models/user_model.dart';

@singleton
class ApiProvider {
  final dio = Dio();
  static const String baseUrl = 'https://api.github.com/users/';

  ApiProvider() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('\n---------- DioRequest ----------'
              '\n\turl: ${options.baseUrl}${options.path}'
              '\n\tmethod: ${options.method}'
              '\n\tquery: ${options.queryParameters}'
              '\n\tdata: ${options.data}'
              '\n\theaders: ${options.headers}\n}'
              '\n--------------------------------\n');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          final options = response.requestOptions;
          print('\n---------- DioResponse ----------'
              '\n\turl: ${options.baseUrl}${options.path}'
              '\n\tmethod: ${options.method}'
              '\n\tresponse: $response'
              '\n--------------------------------\n');
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          final options = error.requestOptions;
          print('\n---------- DioError ----------'
              '\n\turl: ${options.baseUrl}${options.path}'
              '\n\tmethod: ${options.method}'
              '\n\tmessage: ${error.message}'
              '\n\tresponse: ${error.response}'
              '\n--------------------------------\n');
          return handler.next(error);
        },
      ),
    );
  }

  Future<UserModel> getProfile({
    required String nickname,
  }) async {
    final response = await dio.get(
      baseUrl + nickname,
    );
    return UserModel.fromJson(response.data);
  }

  Future<List<FollowingModel>> getFollowing({
    required String nickname,
  }) async {
    final response = await dio.get(
      '$baseUrl$nickname/following',
    );
    return (response.data as List)
        .map((e) => FollowingModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<RepositoriesModel>> getRepositories({
    required String nickname,
  }) async {
    final response = await dio.get(
      '$baseUrl$nickname/repos',
    );
    return (response.data as List)
        .map((e) => RepositoriesModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<FollowerModel>> getFollowers({
    required String nickname,
  }) async {
    final response = await dio.get(
      '$baseUrl$nickname/followers',
    );
    return (response.data as List)
        .map((e) => FollowerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
