import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

class LocalNotificationHandler {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const String darwinNotificationCategoryPlain = 'plainCategory';

  Future<void> setUp() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSetting =
        DarwinInitializationSettings();

    // #2
    const initSettings =
        InitializationSettings(android: androidSetting, iOS: iosSetting);

    // #3
    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        Map<String, dynamic> payLoad =
            json.decode(notificationResponse.payload ?? "");
      },
    ).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }

  Future<void> showNotification( RemoteNotification notification) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('weather_forecast_noti', 'Weather Forecast',
            channelDescription: 'Weather Forecast',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            icon: "@mipmap/ic_launcher");
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        1,
        notification.title,
        notification.body,
        notificationDetails,
        payload:notification.title);
  }
}
