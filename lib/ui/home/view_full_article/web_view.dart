import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../model/NewsResponse.dart';

class WebView extends StatefulWidget {
  News news;

  WebView({required this.news});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final controller;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        setState(() {
          isLoading = false;
        });
      }))
      ..loadRequest(Uri.parse(widget.news.url!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news.title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.greyColor,
                  ),
                )
              : WebViewWidget(controller: controller)),
    );
  }
}
