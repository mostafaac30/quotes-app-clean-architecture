import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repositories/quote_repository.dart';
import '../entities/quote.dart';

class GetRandomQuote extends BaseUseCase<NoParams, Quote> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParams) async {
    return await quoteRepository.getRandomQuote();
  }
}
