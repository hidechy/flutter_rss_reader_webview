// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

import '../../components/article.dart';
import '../../models/item.dart';

class CategoryRssPage extends ConsumerStatefulWidget {
  const CategoryRssPage({super.key, required this.category});

  final String category;

  @override
  ConsumerState<CategoryRssPage> createState() => _CategoryRssPageState();
}

class _CategoryRssPageState extends ConsumerState<CategoryRssPage> {
  Xml2Json xml2json = Xml2Json();

  Map<String, dynamic> data = {};

  ///
  Future<void> getData() async {
    final source = 'https://news.yahoo.co.jp/rss/categories/${widget.category}.xml';

    final response = await http.get(Uri.parse(source));
    xml2json.parse(response.body);

    final jsonData = xml2json.toGData();

    setState(() {
      data = json.decode(jsonData);
    });
  }

  ///
  @override
  void initState() {
    super.initState();

    getData();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.category, style: const TextStyle(fontSize: 12)),
                      Container(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(thickness: 5, color: Colors.white.withOpacity(0.3)),
                  const SizedBox(height: 10),
                ],
              ),
              floating: true,
              backgroundColor: Colors.transparent,
            ),
            if (data.isNotEmpty) ...[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final onedata = data['rss']['channel']['item'][index];

                    return Article(
                      item: Item(
                        title: (onedata['title'] != null) ? onedata['title']['\$t'] : '',
                        link: (onedata['link'] != null) ? onedata['link']['\$t'] : '',
                        pubDate: (onedata['pubDate'] != null) ? onedata['pubDate']['\$t'] : '',
                        image: (onedata['image'] != null) ? onedata['image']['\$t'] : '',
                        comments: (onedata['comments'] != null) ? onedata['comments']['\$t'] : '',
                        description: (onedata['description'] != null) ? onedata['description']['\$t'] : '',
                      ),
                    );
                  },
                  childCount: data['rss']['channel']['item'].length,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
