// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  final _$selectedIndexAtom = Atom(name: '_ProfileStore.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore');

  @override
  dynamic changeIndex(int index) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
