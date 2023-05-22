import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'local_notification_handler.dart';

class FirebaseMessaginHandler {
  final messaging = FirebaseMessaging.instance;

  LocalNotificationHandler localNotificationHandler =
      LocalNotificationHandler();


  initFcm() async {
    @pragma('vm:entry-point')
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((event) {
      localNotificationHandler.showNotification( event.notification!);
    });

  }

  Future<void> saveToken() async {
    print("hello=_inside token");
    String? deviceToken = await messaging.getToken();
    print("token==>${deviceToken}");
   return FirebaseMessaging.instance.subscribeToTopic("weather_forecast_noti").then((value) {
      print("dones");
    }).catchError((onError)=>print("error=>$onError"));

  }
}
