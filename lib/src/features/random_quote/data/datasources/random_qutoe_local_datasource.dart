import 'dart:convert';

import 'package:quote_app_clean_architecture/src/core/utils/constants_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quote_app_clean_architecture/src/features/random_quote/data/models/quote_model.dart';

import '../../../../config/constants.dart';
import '../../../../core/error/error_handler.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;
  RandomQuoteLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<QuoteModel> getLastQuote() {
    final String? lastQuoteJsonString =
        sharedPreferences.getString(Constants.cachedQuote);

    if (lastQuoteJsonString != null) {
      return Future.value(
        QuoteModel.fromJson(json.decode(lastQuoteJsonString)),
      );
    } else {
      throw DataSource.CACHE_ERROR.getFailure();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    sharedPreferences.setString(Constants.cachedQuote, json.encode(quote));
    return Future.value();
  }
}
