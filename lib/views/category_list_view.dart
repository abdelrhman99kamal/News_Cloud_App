import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_card.dart';
import 'package:news_app/models/category_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: "Sports", image: "assets/sports.jpg"),
    CategoryModel(categoryName: "Technology", image: "assets/technology.jpeg"),
    CategoryModel(categoryName: "Science", image: "assets/science.avif"),
    CategoryModel(
      categoryName: "Entertainment",
      image: "assets/entertainment.avif",
    ),
    CategoryModel(categoryName: "Business", image: "assets/business.jpg"),
    CategoryModel(categoryName: "Health", image: "assets/health.avif"),
    // CategoryModel(categoryName: "General", image: "assets/general.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // أو أي ارتفاع يناسب الـ Cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryCard(item: categories[index]),
        itemCount: categories.length,
      ),
    );
  }
}
