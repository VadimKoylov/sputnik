import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:sputnik/core/http/api_provider.dart';
import 'package:sputnik/core/models/user_model.dart';
import 'package:sputnik/core/base_store/i_store.dart';

part 'sign_in_store.g.dart';

@singleton
class SignInStore extends _SignInStore with _$SignInStore {
  SignInStore(ApiProvider apiProvider) : super(apiProvider);
}

abstract class _SignInStore extends IStore<bool> with Store {
  final ApiProvider apiProvider;

  _SignInStore(this.apiProvider);

  @observable
  String nickname = '';

  UserModel? profile;

  @computed
  bool get fail => isSuccess == false && !isFirstTime && !isLoading;

  @action
  void setNickname(String value) => nickname = value;

  @action
  Future<void> getProfile() async {
    try {
      onLoading();
      profile = await apiProvider.getProfile(nickname: nickname);
      onSuccess(true);
    } catch (e) {
      log('Error: $e');
      onError(e.toString());
    }
  }
}
