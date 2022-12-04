import 'package:flutter/material.dart';
import 'package:marvel/data/models/marvel_models.dart';

class Favorites extends ChangeNotifier {
  List<Data> listFavorites = [];
  late bool isFavorite;
  int? id;

  Favorites({this.isFavorite = false,this.id});

  void favoritosOnly(Data data) {
    if (listFavorites.contains(data)) {
    } else {
      listFavorites.add(data);
      notifyListeners();
    }
  }

  void removeFavorites(Data data) {
    listFavorites.remove(data);
    notifyListeners();
  }

  void toogleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
