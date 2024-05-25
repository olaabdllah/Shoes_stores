import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritesNotifier extends ChangeNotifier {
  final _favbox = Hive.box('fav_box');

  List<dynamic> _ids = [];
  List<dynamic> _favorites = [];
  List<dynamic> _fav = [];

  List<dynamic> get ids => _ids;
  set ids(List<dynamic> newIds) {
    _ids = newIds;
    notifyListeners();
  }

  List<dynamic> get favorites => _favorites;
  set favorites(List<dynamic> newFav) {
    _favorites = newFav;
    notifyListeners();
  } 
  
List<dynamic> get fav => _fav;
  set fav(List<dynamic> newFav) {
    _fav = newFav;
    notifyListeners();
  }
  

  getFavorites() {
    final favData = _favbox.keys.map((key) {
      //final item = _favbox.get(key);
      return {
        "key": Key,
        "id": "id",
      };
    }).toList();
    _favorites = favData.toList();
    _ids = _favorites.map((item) => item['id']).toList();
  }

  getAllData() {
    final favDate = _favbox.keys.map((key) {
      final item = _favbox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "name": item['name'],
        "category": item['category'],
        "price": item['price'],
        "imageUrl": item['imageUrl'],
      };
    }).toList();
    _fav = favDate.reversed.toList();
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favbox.add(addFav);
  }
}
