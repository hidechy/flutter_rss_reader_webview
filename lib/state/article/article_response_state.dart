import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_response_state.freezed.dart';

@freezed
class ArticleResponseState with _$ArticleResponseState {
  const factory ArticleResponseState({
    @Default('') String selectFlag,
  }) = _ArticleResponseState;
}
