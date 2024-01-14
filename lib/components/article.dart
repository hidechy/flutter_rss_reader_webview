import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/extensions.dart';
import '../models/item.dart';
import '../screens/alert/article_display_alert.dart';
import 'article_dialog.dart';

class Article extends ConsumerWidget {
  const Article({super.key, required this.item});

  final Item item;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
              child: (item.image == '')
                  ? Container()
                  : FadeInImage.assetNetwork(placeholder: 'assets/images/no_image.png', image: item.image),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  if (item.description != '') ...[
                    Text(
                      item.description.replaceAll('\\n', '').replaceAll('\\', ''),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                  if (item.pubDate != '') ...[
                    Text(HttpDate.parse(item.pubDate).yyyymmdd),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                ArticleDialog(
                  context: context,
                  widget: ArticleDisplayAlert(item: item),
                );
              },
              child: const Icon(Icons.call_made, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
