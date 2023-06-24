import 'package:flutter/material.dart';
import 'package:foodapp/pages/filterPage.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2)
          ])),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  child: const Text(
                    'FoodApp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
        ),
        ListTile(
          title:
              const Text('Categories', style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text(
            'Favorites',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => const FilterPage()),
            );
            ;
          },
        )
      ]),
    );
  }
}
