import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'article_response_state.dart';

final articleProvider = StateNotifierProvider.autoDispose<ArticleNotifier, ArticleResponseState>((ref) {
  return ArticleNotifier(const ArticleResponseState());
});

class ArticleNotifier extends StateNotifier<ArticleResponseState> {
  ArticleNotifier(super.state);

  ///
  Future<void> setSelectFlag({required String flag}) async => state = state.copyWith(selectFlag: flag);
}
