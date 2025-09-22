import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key, required this.url, required this.categoryName});
  final String url;
  final String categoryName;

  @override
  State<ArticleView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<ArticleView> {
  late final WebViewController controller;
  int progress = 0; // علشان نعرض نسبة التحميل

  @override
  void initState() {
    super.initState();
    controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int p) {
                setState(() {
                  progress = p;
                });
              },
              // onPageStarted: (String url) {
              //   debugPrint("Page started: $url");
              // },
              // onPageFinished: (String url) {
              //   debugPrint("Page finished: $url");
              // },
              // onHttpError: (HttpResponseError error) {
              //   debugPrint("Http error: $error");
              //   _showSnackBar(
              //     "خطأ في تحميل الصفحة (HTTP ${error.response?.statusCode ?? ''})",
              //   );
              // },
              // onWebResourceError: (WebResourceError error) {
              //   debugPrint("Resource error: $error");
              //   _showSnackBar("تعذر تحميل المورد: ${error.description}");
              // },
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
  }

  // void _showSnackBar(String message) {
  //   if (!mounted) return;
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message, style: const TextStyle(color: Colors.white)),
  //       backgroundColor: Colors.red,
  //       duration: const Duration(seconds: 3),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          widget.categoryName == 'general'
              ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "News\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Cloud",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
              : AppBar(
                centerTitle: true,
                title: Text(
                  widget.categoryName[0].toUpperCase() +
                      widget.categoryName.substring(1),
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                bottom:
                    progress < 100
                        ? PreferredSize(
                          preferredSize: const Size.fromHeight(3.0),
                          child: LinearProgressIndicator(
                            value: progress / 100,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.blue,
                            ),
                          ),
                        )
                        : null,
              ),
      body: WebViewWidget(controller: controller),
    );
  }
}
