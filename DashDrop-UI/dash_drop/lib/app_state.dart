// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';

class AppState extends ChangeNotifier {
  static AppState _instance = AppState._internal();

  factory AppState() {
    return _instance;
  }

  AppState._internal();

  static void reset() {
    _instance = AppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    // _safeInit(() {
    //   _isLogin = prefs.getBool('isLogin') ?? _isLogin;
    // });
    _safeInit(() {
      _intro = prefs.getBool('intro') ?? _intro;
    });
    _safeInit(() {
      _searchList = prefs.getStringList('searchList') ?? _searchList;
    });
    _safeInit(() {
      _isNotification = prefs.getBool('isNotification') ?? _isNotification;
    });
    _safeInit(() {
      _isHistory = prefs.getBool('isHistory') ?? _isHistory;
    });
    _safeInit(() {
      _isMessage = prefs.getBool('isMessage') ?? _isMessage;
    });
    _safeInit(() {
      _isUpComing = prefs.getBool('isUpComing') ?? _isUpComing;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  // bool _isLogin = false;
  // bool get isLogin => _isLogin;
  // set isLogin(bool _value) {
  //   _isLogin = _value;
  //   prefs.setBool('isLogin', _value);
  // }

  bool _intro = false;
  bool get intro => _intro;
  set intro(bool _value) {
    _intro = _value;
    prefs.setBool('intro', _value);
  }

  int _introIndex = 0;
  int get introIndex => _introIndex;
  set introIndex(int _value) {
    _introIndex = _value;
  }

  List<String> _searchList = [];
  List<String> get searchList => _searchList;
  set searchList(List<String> _value) {
    _searchList = _value;
    prefs.setStringList('searchList', _value);
  }

  void addToSearchList(String _value) {
    _searchList.add(_value);
    prefs.setStringList('searchList', _searchList);
  }

  void removeFromSearchList(String _value) {
    _searchList.remove(_value);
    prefs.setStringList('searchList', _searchList);
  }

  void removeAtIndexFromSearchList(int _index) {
    _searchList.removeAt(_index);
    prefs.setStringList('searchList', _searchList);
  }

  void updateSearchListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchList[_index] = updateFn(_searchList[_index]);
    prefs.setStringList('searchList', _searchList);
  }

  void insertAtIndexInSearchList(int _index, String _value) {
    _searchList.insert(_index, _value);
    prefs.setStringList('searchList', _searchList);
  }

  bool _isNotification = false;
  bool get isNotification => _isNotification;
  set isNotification(bool _value) {
    _isNotification = _value;
    prefs.setBool('isNotification', _value);
  }

  bool _isHistory = false;
  bool get isHistory => _isHistory;
  set isHistory(bool _value) {
    _isHistory = _value;
    prefs.setBool('isHistory', _value);
  }

  bool _isMessage = false;
  bool get isMessage => _isMessage;
  set isMessage(bool _value) {
    _isMessage = _value;
    prefs.setBool('isMessage', _value);
  }

  bool _isUpComing = false;
  bool get isUpComing => _isUpComing;
  set isUpComing(bool _value) {
    _isUpComing = _value;
    prefs.setBool('isUpComing', _value);
  }
}

LatLng1? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng1(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
