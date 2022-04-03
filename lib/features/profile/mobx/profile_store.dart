import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  int selectedIndex = 0;

  @action
  changeIndex(int index) {
    selectedIndex = index;
  }
}
