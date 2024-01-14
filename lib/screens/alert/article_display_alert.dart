import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../models/item.dart';

class ArticleDisplayAlert extends StatefulWidget {
  const ArticleDisplayAlert({super.key, required this.item});

  final Item item;

  @override
  State<ArticleDisplayAlert> createState() => _ArticleDisplayAlertState();
}

class _ArticleDisplayAlertState extends State<ArticleDisplayAlert> {
  late final WebViewController controller;

  ///
  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..loadRequest(Uri.parse(widget.item.link))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.title,
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 20),
              Expanded(child: WebViewWidget(controller: controller)),
            ],
          ),
        ),
      ),
    );
  }
}
