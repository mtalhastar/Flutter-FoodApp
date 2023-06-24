import 'package:flutter/material.dart';
import 'package:foodapp/model/category.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem(
      {super.key, required this.category, required this.onPressed});
  final Category category;
  final void Function() onPressed;
  @override
  State<CategoryItem> createState() {
    // TODO: implement createState
    return _CategoryItem();
  }
}

class _CategoryItem extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: LinearGradient(colors: [
              widget.category.color.withOpacity(1),
              widget.category.color.withOpacity(0.4),
            ])),
        child: Text(widget.category.title,
            style: const TextStyle(color: Colors.white, fontSize: 16.0)),
      ),
    );
  }
}
