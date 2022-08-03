import 'package:dartz/dartz.dart';
import 'package:quote_app_clean_architecture/src/core/error/error_handler.dart';

import 'package:quote_app_clean_architecture/src/core/error/failure.dart';
import 'package:quote_app_clean_architecture/src/core/network/network_info.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/data/datasources/random_quote_romote_datasource.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/data/datasources/random_qutoe_local_datasource.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/domain/entities/quote.dart';

import '../../domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        //fetch quote from api
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        //caching
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } catch (error) {
        print('errrrrrrr*r**r*r*r*r*r*');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      try {
        final cachedQuote = await randomQuoteLocalDataSource.getLastQuote();
        return Right(cachedQuote);
      } catch (error) {
        return Left(DataSource.CACHE_ERROR.getFailure());
      }
    }
  }
}
