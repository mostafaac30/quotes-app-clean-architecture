import 'dart:convert';

import 'package:quote_app_clean_architecture/src/config/constants.dart';
import 'package:quote_app_clean_architecture/src/core/error/error_handler.dart';
import 'package:quote_app_clean_architecture/src/core/error/failure.dart';
import 'package:quote_app_clean_architecture/src/core/network/dio_factory.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/data/models/quote_model.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/domain/entities/quote.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel>
      getRandomQuote(); //QuoteModel in data layer not Quote entity

}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  final DioFactory dioFactory;

  RandomQuoteRemoteDataSourceImpl({required this.dioFactory});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final dio = await dioFactory.getDio();
    try {
      final quote = await dio.get(
        Constants.baseUrl + Constants.randomQuoteEndpoint,
      );
      if (quote.statusCode == 200) {
        return QuoteModel.fromJson(json.encode(quote.data));
      } else {
        throw Failure(quote.statusCode ?? 0, quote.statusMessage ?? '');
      }
    } catch (error) {
      print('errrrrrrorrrrrr*************');
      throw ErrorHandler.handle(error);
    }
  }
}
