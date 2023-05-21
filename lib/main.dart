import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:weatherforecast/bloc/city_weather_page_bloc/city_weather_page_bloc.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_bloc.dart';
import 'package:weatherforecast/persistance/app_database.dart';
import 'package:weatherforecast/screens/home_page/home_page.dart';

import 'bloc/home_page_bloc/home_page_bloc.dart';
import 'helper/fcm_messaging.dart';
import 'helper/local_notification_handler.dart';
import 'helper/route.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("hello insiebackground");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );

  await Firebase.initializeApp();

  FirebaseMessaginHandler().initFcm();

  FirebaseMessaginHandler().saveToken();

  LocalNotificationHandler().setUp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(
            create: (BuildContext context) => HomePageBloc()),
        BlocProvider<CityWeatherPageBloc>(
            create: (BuildContext context) => CityWeatherPageBloc()),
        BlocProvider<SaveCityBloc>(
            create: (BuildContext context) => SaveCityBloc()),
      ],
      child: const MaterialApp(
        title: 'Weather Forecast',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
        home: HomePage(),
      ),
    );
  }
}
