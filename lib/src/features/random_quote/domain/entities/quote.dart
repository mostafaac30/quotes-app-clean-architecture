import 'dart:convert';

import 'package:equatable/equatable.dart';

//TODO: No toJson or fromJson methods in the domain layer. (entity)
class Quote extends Equatable {
  final String author;
  final int id;
  final String quote;
  final String permalink;
  const Quote({
    required this.author,
    required this.id,
    required this.quote,
    required this.permalink,
  });
  // Map<String, dynamic> toMap() {
  //   return {
  //     'author': author,
  //     'id': id,
  //     'quote': quote,
  //     'permalink': permalink,
  //   };
  // }

  // factory Quote.fromMap(Map<String, dynamic> map) {
  //   return Quote(
  //     author: map['author'] ?? '',
  //     id: map['id']?.toInt() ?? 0,
  //     quote: map['quote'] ?? '',
  //     permalink: map['permalink'] ?? '',
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));

  @override
  // TODO: implement props
  List<Object?> get props => [author, id, quote, permalink];
}

// {
//   "author": "Phil Karlton",
//   "id": 43,
//   "quote": "There are only two hard things in Computer Science: cache invalidation, naming things and off-by-one errors.",
//   "permalink": "http://quotes.stormconsultancy.co.uk/quotes/43"
// }