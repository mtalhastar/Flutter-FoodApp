import 'package:flutter/material.dart';
import 'package:foodapp/model/category.dart';
import 'package:foodapp/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatefulWidget {
  const MealItem({super.key, required this.meal,required this.favouritemeals ,required this.showDetails});
  final Meal meal;
  final List<Meal> favouritemeals;
  final Function() showDetails;
  @override
  State<MealItem> createState() {
    // TODO: implement createState
    return _MealItem();
  }
}

class _MealItem extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.showDetails,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        children: [
           FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(widget.meal.imageUrl)),

          Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                color: const Color.fromARGB(113, 0, 0, 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.meal.title,
                      style: const TextStyle(
                          color: Color.fromARGB(242, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(children: [
                            const Icon(
                              Icons.timer,
                              semanticLabel: '10min',
                            ),
                            Expanded(
                              child: Text('${widget.meal.duration}m',
                                  style: const TextStyle(
                                    color: Color.fromARGB(221, 255, 255, 255),
                                    fontSize: 16,
                                  )),
                            )
                          ]),
                        ),
                        Expanded(
                          child: Row(children: [
                            const Icon(
                              Icons.add_home_rounded,
                              semanticLabel: '10min',
                            ),
                            Expanded(
                              child: Text(widget.meal.complexity.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color.fromARGB(221, 255, 255, 255),
                                    fontSize: 16,
                                  )),
                            )
                          ]),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
