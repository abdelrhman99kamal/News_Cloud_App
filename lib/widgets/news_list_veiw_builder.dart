import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/error_message.dart';
import 'package:news_app/models/articale_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/views/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(
      dio: Dio(),
    ).getTopHeadlines(category: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: ErrorMessage(
              message: 'there was an error, please try again later.',
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }
      },
    );
  }
}
