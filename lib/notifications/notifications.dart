import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  late BuildContext _context;

  Future<FlutterLocalNotificationsPlugin> initNotifies(
      BuildContext context) async {
    this._context = context;

    //-----------------------------| Initialize local notifications |--------------------------------------
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS =
        DarwinInitializationSettings(); // Updated to DarwinInitializationSettings
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            onSelectNotification); // Updated callback
    return flutterLocalNotificationsPlugin;
    //======================================================================================================
  }

  //---------------------------------| Show the notification in the specific time |-------------------------------
  Future showNotification(String title, String description, int time, int id,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        description,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: time)),
        const NotificationDetails(
            android: AndroidNotificationDetails('medicines_id', 'medicines',
                importance: Importance.high,
                priority: Priority.high,
                color: Colors.cyanAccent)),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  //================================================================================================================

  //-------------------------| Cancel the notify |---------------------------
  Future removeNotify(int notifyId,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    try {
      return await flutterLocalNotificationsPlugin.cancel(notifyId);
    } catch (e) {
      return null;
    }
  }

  //==========================================================================

  //-------------| function to initialize local notifications |---------------------------
  void onSelectNotification(NotificationResponse notificationResponse) async {
    // Updated callback
    showDialog(
      context: _context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Payload"),
          content: Text("Payload : ${notificationResponse.payload}"),
        );
      },
    );
  }
  //======================================================================================
}
