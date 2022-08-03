import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app_clean_architecture/src/config/routes/routes_manager.dart';
import 'package:quote_app_clean_architecture/src/core/utils/strings_manager.dart';
import 'package:quote_app_clean_architecture/src/config/themes/theme_manager.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:sizer/sizer.dart';
import '../injector.dart' as di;

class MyQuoteApp extends StatelessWidget {
  const MyQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (BuildContext context, Orientation orientation,
                DeviceType deviceType) =>
            getMaterialApp());
  }

  Widget getMaterialApp() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RandomQuoteCubit>(
          create: (context) => di.sl<RandomQuoteCubit>(),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: '/home',
        title: AppStrings.appName,
        theme: getAppTheme(),
      ),
    );
  }
}
