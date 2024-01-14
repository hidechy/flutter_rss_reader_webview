import 'package:flutter/material.dart';

import 'page/category_rss_page.dart';

class TabInfo {
  TabInfo(this.label, this.widget);

  String label;
  Widget widget;
}

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<TabInfo> tabs = [];

  Map<String, String> categoryMap = {
    'domestic': '国内',
    'world': '国際',
    'business': '経済',
    'entertainment': 'エンタメ',
    'sports': 'スポーツ',
    'it': 'IT',
    'science': '科学',
    'life': 'ライフ',
    'local': '地域',
  };

  ///
  @override
  Widget build(BuildContext context) {
    makeTab();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Rss Reader'),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.blueAccent,
              tabs: tabs.map((TabInfo tab) => Tab(text: tab.label)).toList(),
            ),
          ),
        ),
        body: TabBarView(children: tabs.map((tab) => tab.widget).toList()),
      ),
    );
  }

  ///
  void makeTab() {
    tabs = [];

    categoryMap.forEach((key, value) {
      tabs.add(
        TabInfo(
          value,
          CategoryRssPage(
            category: key,
          ),
        ),
      );
    });
  }
}
