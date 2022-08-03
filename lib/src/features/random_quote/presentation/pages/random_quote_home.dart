import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app_clean_architecture/src/core/utils/color_manager.dart';
import 'package:quote_app_clean_architecture/src/core/widgets/error_widget.dart'
    as error;
import '../cubit/random_quote_cubit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: ((context, state) {
      if (state is RandomQuoteLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: ColorManager.redColor,
          ),
        );
      } else if (state is RandomQuoteError) {
        return error.ErrorWidget(
          onPress: () => _getRandomQuote(),
        );
      } else if (state is RandomQuoteSuccess) {
        return Padding(
          padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
          child: Column(
            children: [
              Text(
                state.quote.quote,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                state.quote.author,
                textAlign: TextAlign.end,
              ),
              InkWell(
                  onTap: () => _getRandomQuote(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorManager.redColor),
                    child: const Icon(
                      Icons.refresh,
                      size: 28,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: ColorManager.redColor,
          ),
        );
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Scaffold(body: _buildBodyContent()),
        onRefresh: () => _getRandomQuote());
  }
}
