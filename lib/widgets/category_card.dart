import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

import '../views/category_view.dart' show CategoryView;

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.item});
  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(categoryName: item.categoryName);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(item.image),
            fit: BoxFit.fill,
          ),
        ),
        width: 210,
        height: 130,
        child: Center(
          child: Text(
            item.categoryName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
