import 'package:mobx/mobx.dart';

part 'left_side_menu_store.g.dart';

class LeftSideMenuStore = _LeftSideMenuStore with _$LeftSideMenuStore;

abstract class _LeftSideMenuStore with Store {
  @observable
  int selectedItem = 0;

  @action
  void changeIndex(int num) {
    selectedItem = num;
  }
}
