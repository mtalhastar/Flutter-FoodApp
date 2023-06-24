import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:foodapp/data/Favourites.dart';

class Meal_Detail extends StatefulWidget {
  const Meal_Detail(this.meal, {super.key});
  final Meal meal;
  @override
  State<Meal_Detail> createState() {
    // TODO: implement createState
    return _Meal_Detail();
  }
}

class _Meal_Detail extends State<Meal_Detail> {
  String mealtext = '';
  bool clicked = false;
  void mealStepstotal() {
    mealtext = '';
    for (final meal in widget.meal.steps) {
      mealtext = mealtext + meal;
    }
  }

  @override
  Widget build(BuildContext context) {
    mealStepstotal();
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(widget.meal.imageUrl)),
            Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.favorite),
                  style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                          clicked ? Colors.red : Colors.white)),
                  onPressed: () {
                    setState(() {
                      if (clicked == false) {
                        clicked = true;
                        if (!(favouriteMeals.contains(widget.meal))) {
                          favouriteMeals.add(widget.meal);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to Favorites'),
                            duration: Duration(seconds: 2),)
                          
                        );
                        }
                      } else {
                        clicked = false;
                        favouriteMeals.remove(widget.meal);
                               ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Removed from favourites'),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    });
                  },
                ))
          ]),
          Text(
            widget.meal.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Ingredients',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          ...widget.meal.ingredients.map(
            (e) => Text(
              e,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Steps',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              child: SingleChildScrollView(
                child: Text(mealtext,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
