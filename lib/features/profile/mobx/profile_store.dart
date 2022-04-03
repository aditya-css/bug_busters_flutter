import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  int selectedIndex = 0;

  @observable
  List<String> access = [""];

  @action
  changeIndex(int index) {
    selectedIndex = index;
  }
}
