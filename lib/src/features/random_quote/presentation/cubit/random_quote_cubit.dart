import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app_clean_architecture/src/core/error/error_handler.dart';
import 'package:quote_app_clean_architecture/src/core/error/failure.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/domain/entities/quote.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/domain/usecases/get_random_quote.dart';

import '../../../../core/usecases/base_usecase.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());
  final GetRandomQuote getRandomQuoteUseCase;

  static RandomQuoteCubit get(context) =>
      BlocProvider.of<RandomQuoteCubit>(context);

  Future<void> getRandomQuote() async {
    emit(RandomQuoteLoading());

    Either<Failure, Quote> response =
        await getRandomQuoteUseCase.call(NoParams());
    emit(response.fold(
        (error) =>
            RandomQuoteError(msg: ErrorHandler.handle(error).failure.message),
        (quote) => RandomQuoteSuccess(quote: quote)));
  }
}
