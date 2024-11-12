import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicines/screens/add_new_medicine/add_new_medicine.dart';
import 'package:medicines/screens/home/home.dart';
import './screens/welcome/welcome.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MedicineApp(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.05),
      statusBarColor: Colors.black.withOpacity(0.05),
      statusBarIconBrightness: Brightness.dark));
}

class MedicineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 18, 2, 62),
          fontFamily: "Popins",
          primaryColor: Color.fromRGBO(7, 190, 200, 1),
          textTheme: TextTheme(
              displayLarge: ThemeData.light().textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 38.0,
                    fontFamily: "Popins",
                  ),
              headlineSmall: ThemeData.light().textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                    fontFamily: "Popins",
                  ),
              displaySmall: ThemeData.light().textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    fontFamily: "Popins",
                  ))),
      routes: {
        "/": (context) => Welcome(),
        "/home": (context) => Home(),
        "/add_new_medicine": (context) => AddNewMedicine(),
        //"/medInfo": (context) => DisplayMedInfo(),
      },
      initialRoute: "/",
    );
  }
}
