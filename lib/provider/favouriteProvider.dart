import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/model/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);

  void addFavouriteMeals(Meal meal) {
    state = [...state, meal];
  }

  void removeMeals(Meal meal) {
    state.remove(meal);
  }
}

final mealprov =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});
