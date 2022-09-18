import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:sputnik/core/http/api_provider.dart';
import 'package:sputnik/core/base_store/i_store.dart';
import 'package:sputnik/core/models/following_model.dart';
import 'package:sputnik/core/models/repositories_model.dart';

part 'home_store.g.dart';

@singleton
class HomeStore extends _HomeStore with _$HomeStore {
  HomeStore(ApiProvider apiProvider) : super(apiProvider);
}

abstract class _HomeStore extends IStore<bool> with Store {
  final ApiProvider apiProvider;

  _HomeStore(this.apiProvider);

  ObservableList<FollowingModel> following = ObservableList.of([]);

  ObservableList<RepositoriesModel> repositories = ObservableList.of([]);

  @action
  Future<void> getFollowing(String nickname) async {
    try {
      onLoading();
      following = ObservableList.of(
        await apiProvider.getFollowing(nickname: nickname),
      );
      onSuccess(true);
    } catch (e) {
      onError(e.toString());
    }
  }

  @action
  Future<void> getRepositories(String nickname) async {
    try {
      onLoading();
      repositories = ObservableList.of(
        await apiProvider.getRepositories(nickname: nickname),
      );
      onSuccess(true);
    } catch (e) {
      onError(e.toString());
    }
  }
}
