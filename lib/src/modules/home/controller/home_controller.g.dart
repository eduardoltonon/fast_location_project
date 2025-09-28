// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$cepInputAtom =
      Atom(name: '_HomeControllerBase.cepInput', context: context);

  @override
  String get cepInput {
    _$cepInputAtom.reportRead();
    return super.cepInput;
  }

  @override
  set cepInput(String value) {
    _$cepInputAtom.reportWrite(value, super.cepInput, () {
      super.cepInput = value;
    });
  }

  late final _$currentAddressAtom =
      Atom(name: '_HomeControllerBase.currentAddress', context: context);

  @override
  AddressModel? get currentAddress {
    _$currentAddressAtom.reportRead();
    return super.currentAddress;
  }

  @override
  set currentAddress(AddressModel? value) {
    _$currentAddressAtom.reportWrite(value, super.currentAddress, () {
      super.currentAddress = value;
    });
  }

  late final _$addressHistoryAtom =
      Atom(name: '_HomeControllerBase.addressHistory', context: context);

  @override
  ObservableList<AddressModel> get addressHistory {
    _$addressHistoryAtom.reportRead();
    return super.addressHistory;
  }

  @override
  set addressHistory(ObservableList<AddressModel> value) {
    _$addressHistoryAtom.reportWrite(value, super.addressHistory, () {
      super.addressHistory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HomeControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$searchAddressAsyncAction =
      AsyncAction('_HomeControllerBase.searchAddress', context: context);

  @override
  Future<void> searchAddress() {
    return _$searchAddressAsyncAction.run(() => super.searchAddress());
  }

  late final _$loadHistoryAsyncAction =
      AsyncAction('_HomeControllerBase.loadHistory', context: context);

  @override
  Future<void> loadHistory() {
    return _$loadHistoryAsyncAction.run(() => super.loadHistory());
  }

  late final _$launchMapAsyncAction =
      AsyncAction('_HomeControllerBase.launchMap', context: context);

  @override
  Future<void> launchMap() {
    return _$launchMapAsyncAction.run(() => super.launchMap());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void setCepInput(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setCepInput');
    try {
      return super.setCepInput(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearInput() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearInput');
    try {
      return super.clearInput();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cepInput: ${cepInput},
currentAddress: ${currentAddress},
addressHistory: ${addressHistory},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
