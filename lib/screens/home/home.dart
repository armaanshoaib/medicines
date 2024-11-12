// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../notifications/notifications.dart';
// import '../../database/repository.dart';
// import '../../models/pill.dart';
// import '../../screens/home/medicines_list.dart';
// import '../../screens/home/calendar.dart';
// import '../../models/calendar_day_model.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   //-------------------| Flutter notifications |-------------------
//   final Notifications _notifications = Notifications();
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   //===============================================================

//   //--------------------| List of Pills from database |----------------------
//   List<Pill> allListOfPills = [];
//   final Repository _repository = Repository();
//   List<Pill> dailyPills = [];
//   //=========================================================================

//   //-----------------| Calendar days |------------------
//   final CalendarDayModel _days = CalendarDayModel(
//     dayLetter: '',
//     dayNumber: 0,
//     month: 0,
//     year: 0,
//     isChecked: false,
//   );
//   late List<CalendarDayModel> _daysList;
//   //====================================================

//   //handle last choose day index in calendar
//   int _lastChooseDay = 0;

//   @override
//   void initState() {
//     super.initState();
//     initNotifies();
//     setData();
//     _daysList = _days.getCurrentDays();
//   }

//   //init notifications
//   Future initNotifies() async => flutterLocalNotificationsPlugin =
//       await _notifications.initNotifies(context);

//   //--------------------GET ALL DATA FROM DATABASE---------------------
//   Future setData() async {
//     allListOfPills.clear();
//     (await _repository.getAllData("Pills")).forEach((pillMap) {
//       allListOfPills.add(Pill(
//         id: pillMap['id'],
//         howManyWeeks: pillMap['howManyWeeks'],
//         time: pillMap['time'],
//         amount: pillMap['amount'],
//         medicineForm: pillMap['medicineForm'],
//         name: pillMap['name'],
//         type: pillMap['type'],
//         notifyId: pillMap['notifyId'],
//       ).pillMapToObject(pillMap));
//     });
//     chooseDay(_daysList[_lastChooseDay]);
//   }
//   //===================================================================

//   @override
//   Widget build(BuildContext context) {
//     final double deviceHeight =
//         MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

//     final Widget addButton = FloatingActionButton.extended(
//       label: Text(
//         "Add Medicine",
//         style: GoogleFonts.quicksand(
//           textStyle: Theme.of(context).textTheme.displayLarge,
//           color: Colors.white,
//           fontSize: 20,
//           // fontWeight: FontWeight.w700,
//         ),
//       ),
//       elevation: 2.0,
//       isExtended: true,
//       onPressed: () async {
//         //refresh the pills from database
//         await Navigator.pushNamed(context, "/add_new_medicine")
//             .then((_) => setData());
//       },
//       icon: Icon(
//         Icons.add,
//         color: Colors.white,
//         size: 40.0,
//       ),
//       backgroundColor: Color(0xff6750a4),
//     );

//     return Scaffold(
//       floatingActionButton: addButton,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       backgroundColor: Color.fromRGBO(248, 248, 248, 1),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.only(
//                 top: 0.0, left: 25.0, right: 25.0, bottom: 20.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: deviceHeight * 0.04,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Container(
//                     alignment: Alignment.topCenter,
//                     height: deviceHeight * 0.1,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "My Medicines",
//                           style: GoogleFonts.quicksand(
//                             textStyle: Theme.of(context).textTheme.displayLarge,
//                             color: const Color.fromARGB(255, 42, 13, 129),
//                             fontSize: 30,
//                             // fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: deviceHeight * 0.01,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Calendar(chooseDay, _daysList),
//                 ),
//                 SizedBox(height: deviceHeight * 0.03),
//                 dailyPills.isEmpty
//                     ? SizedBox(
//                         width: double.infinity,
//                         height: 100,
//                         child: AutoSizeText(
//                           "No Medicines Added Yet!",
//                           style: GoogleFonts.quicksand(
//                             textStyle: Theme.of(context).textTheme.displayLarge,

//                             color: const Color.fromARGB(255, 146, 146, 146),
//                             fontSize: 25,
//                             // fontWeight: FontWeight.w700,
//                           ),
//                           textAlign: TextAlign.center,
//                           //   maxLines: 2,
//                         ),
//                       )
//                     : MedicinesList(
//                         dailyPills, setData, flutterLocalNotificationsPlugin)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   //-------------------------| Click on the calendar day |-------------------------

//   void chooseDay(CalendarDayModel clickedDay) {
//     setState(() {
//       _lastChooseDay = _daysList.indexOf(clickedDay);
//       _daysList.forEach((day) => day.isChecked = false);
//       CalendarDayModel chooseDay = _daysList[_daysList.indexOf(clickedDay)];
//       chooseDay.isChecked = true;
//       dailyPills.clear();
//       allListOfPills.forEach((pill) {
//         DateTime pillDate =
//             DateTime.fromMicrosecondsSinceEpoch(pill.time * 1000);
//         if (chooseDay.dayNumber == pillDate.day &&
//             chooseDay.month == pillDate.month &&
//             chooseDay.year == pillDate.year) {
//           dailyPills.add(pill);
//         }
//       });
//       dailyPills.sort((pill1, pill2) => pill1.time.compareTo(pill2.time));
//     });
//   }

//   //===============================================================================
// }

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../notifications/notifications.dart';
import '../../database/repository.dart';
import '../../models/pill.dart';
import '../../screens/home/medicines_list.dart';
import '../../screens/home/calendar.dart';
import '../../models/calendar_day_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //-------------------| Flutter notifications |-------------------
  final Notifications _notifications = Notifications();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  //===============================================================

  //--------------------| List of Pills from database |----------------------
  List<Pill> allListOfPills = [];
  final Repository _repository = Repository();
  List<Pill> dailyPills = [];
  //=========================================================================

  //-----------------| Calendar days |------------------
  final CalendarDayModel _days = CalendarDayModel(
    dayLetter: '',
    dayNumber: 0,
    month: 0,
    year: 0,
    isChecked: false,
  );
  late List<CalendarDayModel> _daysList;
  //====================================================

  int _lastChooseDay = 0;

  @override
  void initState() {
    super.initState();
    initNotifies();
    setData();
    _daysList = _days.getCurrentDays();
  }

  // Initialize notifications
  Future initNotifies() async {
    flutterLocalNotificationsPlugin =
        await _notifications.initNotifies(context);
  }

  // Fetch all data from the database
  Future setData() async {
    allListOfPills.clear();
    (await _repository.getAllData("Pills")).forEach((pillMap) {
      allListOfPills.add(Pill(
        id: pillMap['id'],
        howManyWeeks: pillMap['howManyWeeks'],
        time: pillMap['time'],
        amount: pillMap['amount'],
        medicineForm: pillMap['medicineForm'],
        name: pillMap['name'],
        type: pillMap['type'],
        notifyId: pillMap['notifyId'],
      ).pillMapToObject(pillMap));
    });
    chooseDay(_daysList[_lastChooseDay]);
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final Widget addButton = FloatingActionButton.extended(
      label: Text(
        "Add Medicine",
        style: GoogleFonts.quicksand(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      elevation: 4.0,
      isExtended: true,
      onPressed: () async {
        await Navigator.pushNamed(context, "/add_new_medicine")
            .then((_) => setData());
      },
      icon: Icon(
        Icons.add,
        color: Colors.white,
        size: 28.0,
      ),
      backgroundColor: Color(0xff6750a4),
    );

    return Scaffold(
      floatingActionButton: addButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: deviceHeight * 0.01),
                _buildHeader(),
                SizedBox(height: deviceHeight * 0.02),
                Calendar(chooseDay, _daysList),
                SizedBox(height: deviceHeight * 0.04),
                _buildPillsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Text(
        "My Medicines",
        style: GoogleFonts.quicksand(
          color: Color(0xff2a0d81),
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPillsSection() {
    return dailyPills.isEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: AutoSizeText(
                "No Medicines Added Yet!",
                style: GoogleFonts.quicksand(
                  color: Color(0xff929292),
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : MedicinesList(dailyPills, setData, flutterLocalNotificationsPlugin);
  }

  void chooseDay(CalendarDayModel clickedDay) {
    setState(() {
      _lastChooseDay = _daysList.indexOf(clickedDay);
      for (var day in _daysList) {
        day.isChecked = false;
      }
      var selectedDay = _daysList[_daysList.indexOf(clickedDay)];
      selectedDay.isChecked = true;
      dailyPills.clear();
      for (var pill in allListOfPills) {
        var pillDate = DateTime.fromMicrosecondsSinceEpoch(pill.time * 1000);
        if (selectedDay.dayNumber == pillDate.day &&
            selectedDay.month == pillDate.month &&
            selectedDay.year == pillDate.year) {
          dailyPills.add(pill);
        }
      }
      dailyPills.sort((pill1, pill2) => pill1.time.compareTo(pill2.time));
    });
  }
}
