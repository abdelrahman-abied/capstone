import 'dart:math';
import 'dart:typed_data';
// import 'package:eshop/utils/log.dart';
import 'package:firebase_messaging_platform_interface/src/remote_notification.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

class LocalNotification {
  late FlutterLocalNotificationsPlugin flutterNotificationPlugin;
  LocalNotification() {
    flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterNotificationPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String? payload) async {
    print(payload);
  }

  void showNotification({
    required String title,
    required String body,
    required String image,
    required int id,
    AndroidNotification? icon,
  }) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    // final ByteArrayAndroidBitmap bigPicture = ByteArrayAndroidBitmap(
    //     await _getByteArrayFromUrl(
    //         "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_1280.jpg"));
    // Log.d(image);
    // var bigPictureStyleInformation = BigPictureStyleInformation(
    //   bigPicture,
    // largeIcon: DrawableResourceAndroidBitmap('app_logo'),
    //   contentTitle: title,
    //   summaryText: body,
    //   htmlFormatContentTitle: true,
    //   htmlFormatSummaryText: true,
    // );
    var android = AndroidNotificationDetails(
      "high_importance_channel",
      "High Importance Notifications",
      priority: Priority.high,
      autoCancel: true,
      icon: icon?.smallIcon,
      // icon: 'app_logo',
      // largeIcon: const DrawableResourceAndroidBitmap('app_logo'),
      // styleInformation: bigPictureStyleInformation,
      importance: Importance.max,
      ongoing: true,
    );
    var ios = IOSNotificationDetails();
    var notificationPlatformDetails =
        NotificationDetails(android: android, iOS: ios);
    // int id = Random().nextInt(1000);
    print(id);
    flutterNotificationPlugin.show(
      id,
      title,
      "$body",
      notificationPlatformDetails,
      payload: "message sent",
    );
    // await flutterNotificationPlugin.cancel(id);
  }

  // Future<void> _showBigPictureNotificationURL() async {
  //   var bigPicture = ByteArrayAndroidBitmap(
  //       await _getByteArrayFromUrl('https://via.placeholder.com/400x800'));

  //   final BigPictureStyleInformation bigPictureStyleInformation =
  //       BigPictureStyleInformation(bigPicture,
  //           largeIcon: bigPicture,
  //           contentTitle: 'overridden <b>big</b> content title',
  //           htmlFormatContentTitle: true,
  //           summaryText: 'summary <i>text</i>',
  //           htmlFormatSummaryText: true);
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('big text channel id',
  //           'big text channel name', 'big text channel description',
  //           styleInformation: bigPictureStyleInformation);
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   flutterNotificationPlugin.show(
  //       0, 'big text title', 'silent body', platformChannelSpecifics);
  // }

  Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }
}
