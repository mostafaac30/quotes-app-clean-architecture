part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteLoading extends RandomQuoteState {}

class RandomQuoteSuccess extends RandomQuoteState {
  Quote quote;
  RandomQuoteSuccess({
    required this.quote,
  });

  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  String msg;
  RandomQuoteError({
    required this.msg,
  });

  @override
  List<Object> get props => [msg];
}
