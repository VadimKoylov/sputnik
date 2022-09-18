import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:sputnik/core/http/api_provider.dart';
import 'package:sputnik/core/base_store/i_store.dart';
import 'package:sputnik/core/models/follower_model.dart';

part 'followers_store.g.dart';

@singleton
class FollowersStore extends _FollowersStore with _$FollowersStore {
  FollowersStore(ApiProvider apiProvider) : super(apiProvider);
}

abstract class _FollowersStore extends IStore<bool> with Store {
  final ApiProvider apiProvider;

  _FollowersStore(this.apiProvider);

  String? nickname;

  ObservableList<FollowerModel> followers = ObservableList.of([]);

  void setUser(String value) => nickname = value;

  @action
  Future<void> getFollowers() async {
    try {
      onLoading();
      followers = ObservableList.of(
        await apiProvider.getFollowers(nickname: nickname ?? ''),
      );
      onSuccess(true);
    } catch (e) {
      onError(e.toString());
    }
  }
}
