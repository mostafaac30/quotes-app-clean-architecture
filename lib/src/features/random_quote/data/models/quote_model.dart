import 'dart:convert';

import 'package:quote_app_clean_architecture/src/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required super.author,
      required super.id,
      required super.quote,
      required super.permalink});

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'id': id,
      'quote': quote,
      'permalink': permalink,
    };
  }

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      author: map['author'] ?? '',
      id: map['id']?.toInt() ?? 0,
      quote: map['quote'] ?? '',
      permalink: map['permalink'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteModel.fromJson(String source) =>
      QuoteModel.fromMap(json.decode(source));
}
