// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStore, Store {
  Computed<bool>? _$failComputed;

  @override
  bool get fail => (_$failComputed ??=
          Computed<bool>(() => super.fail, name: '_SignInStore.fail'))
      .value;

  late final _$nicknameAtom =
      Atom(name: '_SignInStore.nickname', context: context);

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  late final _$getProfileAsyncAction =
      AsyncAction('_SignInStore.getProfile', context: context);

  @override
  Future<void> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  late final _$_SignInStoreActionController =
      ActionController(name: '_SignInStore', context: context);

  @override
  void setNickname(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.setNickname');
    try {
      return super.setNickname(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nickname: ${nickname},
fail: ${fail}
    ''';
  }
}
