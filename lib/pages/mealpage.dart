import 'package:flutter/material.dart';
import 'package:foodapp/widget/category_item.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/widget/meal_item.dart';
import 'package:foodapp/model/meal.dart';
import 'package:foodapp/widget/meal_detail.dart';

class MealPage extends StatefulWidget {
  const MealPage(this.title, this.meals, {super.key});
  final String title;
  final List<Meal> meals;
  @override
  State<MealPage> createState() {
    // TODO: implement createState
    return _MealPage();
  }
}

class _MealPage extends State<MealPage> {
  void showDetails(Meal mealss) {
    final Meal meal = widget.meals.firstWhere((e) => e.id == mealss.id);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => Meal_Detail(meal)),
      );
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              meal: widget.meals[index],
              favouritemeals: widget.meals,
              showDetails: () {
                showDetails(widget.meals[index]);
              },
            );
          },
          itemCount: widget.meals.length,
        )));
  }
}
