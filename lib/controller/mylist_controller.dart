import 'package:flutter/material.dart';
import 'package:marvel/data/models/marvel_models.dart';

class MyListController extends ChangeNotifier {
  List<Data> myList = [];

  void myListOnly(Data data) {
    if (myList.contains(data)) {
    } else {
      myList.add(data);
      notifyListeners();
    }
  }

  void removeFavorites(Data data) {
    myList.remove(data);
    notifyListeners();
  }
}