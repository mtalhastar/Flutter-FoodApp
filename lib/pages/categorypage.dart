import 'package:flutter/material.dart';
import 'package:foodapp/model/category.dart';
import 'package:foodapp/widget/category_item.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/pages/mealpage.dart';
import 'package:foodapp/model/meal.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});
  @override
  State<CategoryPage> createState() {
    // TODO: implement createState
    return _CategoryPage();
  }
}

class _CategoryPage extends State<CategoryPage> {
  void selectTheCategory(Category category) {
    final meallist =
        dummyMeals.where((e) => e.categories.contains(category.id)).toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealPage(category.title, meallist)));
  }

   double height = 100;

   @override
  void initState() {
    super.initState();

    // Set a delay to start the animation
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        height = 0;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      margin: EdgeInsets.symmetric(vertical: height),
      curve: Curves.bounceOut,
      child: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 4.0, crossAxisSpacing: 4.0),
        children: [
          ...availableCategories.map((e) => CategoryItem(
                category: e,
                onPressed: () => selectTheCategory(e),
              ))
        ],
      ),
    ));
  }
}
