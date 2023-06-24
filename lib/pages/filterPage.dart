import 'package:flutter/material.dart';
import 'package:foodapp/model/category.dart';
import 'package:foodapp/widget/category_item.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/pages/mealpage.dart';
import 'package:foodapp/model/meal.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});
  @override
  State<FilterPage> createState() {
    // TODO: implement createState
    return _FilterPage();
  }
}

class _FilterPage extends State<FilterPage> {
  bool isvegan = false;
  bool nullable = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: isvegan,
              onChanged: (value) {
                setState(() {
                if (value) {
                  isvegan = true;
                } else {
                  isvegan = false;
                }
                 });
              },
              title: const Text(
                'Is-Vegan ?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SwitchListTile(
              value: nullable,
              onChanged: (value) {
                setState(() {
                 if (value) {
                  nullable = true;
                } else {
                  nullable = false;
                }
                 });
              },
              title: const Text(
                'Is-Nullable ?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )));
  }
}
