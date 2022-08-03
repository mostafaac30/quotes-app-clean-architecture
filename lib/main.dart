import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quote_app_clean_architecture/src/core/utils/bloc_Observer.dart';
import 'package:quote_app_clean_architecture/src/injector.dart' as di;

import 'src/features/app.dart';

void main() async {
  BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
    runApp(const MyQuoteApp());
  }, blocObserver: MyBlocObserver());
}
