import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:news_app/models/articale_model.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length, (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 22.0),
          child: NewsTile(articleModel: articles[index]),
        );
      }),
    );
  }
}
