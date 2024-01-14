import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rss_reader/state/article/article_notifier.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../models/item.dart';

// ignore: must_be_immutable
class ArticleDisplayAlert extends ConsumerWidget {
  ArticleDisplayAlert({super.key, required this.item});

  final Item item;

  late WebViewController controller;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectFlag = ref.watch(articleProvider.select((value) => value.selectFlag));

    var openSource = '';

    if (selectFlag == '') {
      openSource = item.link;
    }

    switch (selectFlag) {
      case 'link':
        openSource = item.link;
        break;
      case 'comments':
        openSource = item.comments;
        break;
    }

    controller = WebViewController()
      ..loadRequest(Uri.parse(openSource))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () => ref.read(articleProvider.notifier).setSelectFlag(flag: 'link'),
                    child: const Text('link'),
                  ),
                  TextButton(
                    onPressed: () => ref.read(articleProvider.notifier).setSelectFlag(flag: 'comments'),
                    child: const Text('comments'),
                  ),
                ],
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
