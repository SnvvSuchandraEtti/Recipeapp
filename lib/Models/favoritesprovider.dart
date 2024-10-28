import 'package:flutter/material.dart';
import 'package:provider_1/Models/meals_model.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Meal> _favorites = [];

  List<Meal> get favorites => _favorites;

  bool isFavorite(Meal meal) {
    return _favorites.contains(meal);
  }

  void toggleFavorite(Meal meal) {
    if (isFavorite(meal)) {
      _favorites.remove(meal);
    } else {
      _favorites.add(meal);
    }
    notifyListeners();
  }
}
