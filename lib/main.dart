import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendline/shared/components/constants.dart';
import 'package:trendline/shared/network/Local/cache.dart';
import 'package:trendline/shop_cubit/Shop_Cubit.dart';
import 'package:trendline/shop_cubit/shopLayout.dart';
import 'package:trendline/shop_cubit/shop_States.dart';
import 'package:trendline/styles/Theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'onBoarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache_Helper.init();
  Widget wid = Container();
  bool? onBoard = Cache_Helper.getData(key: 'OnBoarding');
  userToken = Cache_Helper.getData(key: 'token');

  if (onBoard != null) {
    if (userToken != null) {
      wid = const ShopLayout();
    }
  } else {
    wid = OnBoarding_Screen();
  }

  runApp(MyApp(wid));
}

class MyApp extends StatelessWidget {
  final Widget currentScreen;
  const MyApp(this.currentScreen, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ShopCubit(),
          )
        ],
        child: BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              locale: const Locale('ar', 'AR'),
              supportedLocales: const [ Locale('ar', 'AR')],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              home: currentScreen,
            );
          },
        ));
  }
}



