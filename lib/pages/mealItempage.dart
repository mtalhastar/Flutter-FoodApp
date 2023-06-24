import 'package:flutter/material.dart';
import 'package:foodapp/pages/mealItempage.dart';
import 'package:foodapp/widget/meal_detail.dart';
import 'package:foodapp/model/meal.dart';
class MealItemPage extends StatelessWidget {
  const MealItemPage(this.meal, {super.key});
  final Meal meal;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      title: Text(meal.title),
    ),
    body: Meal_Detail(meal),);
  }
}
