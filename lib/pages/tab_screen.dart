import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/model/meal.dart';
import 'package:foodapp/pages/categorypage.dart';
import 'package:foodapp/pages/mealpage.dart';
import 'package:foodapp/pages/side_drawer.dart';
import 'package:foodapp/provider/favouriteProvider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<TabsScreen> createState() {
    // TODO: implement createState
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  String title = 'Category';
  void SelectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Widget activePage = const CategoryPage();
    final favouriteMeal = ref.watch(mealprov);
    if (selectedPageIndex == 1) {
      setState(() {
        activePage = MealPage('j', favouriteMeal);
        title = 'Favourite';
      });
    } else {
      title = 'Category';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: SelectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
