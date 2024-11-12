import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:medicines/database/repository.dart';
import 'package:medicines/models/pill.dart';
import 'package:medicines/notifications/notifications.dart';
import 'package:medicines/screens/dispInfo/display_med_info.dart';

class MedicineCard extends StatelessWidget {
  final Pill medicine;
  final Function setData;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  MedicineCard(
      this.medicine, this.setData, this.flutterLocalNotificationsPlugin);

  @override
  Widget build(BuildContext context) {
    //check if the medicine time is lower than actual
    final bool isEnd = DateTime.now().millisecondsSinceEpoch > medicine.time;

    return Card(
        elevation: 0.0,
        margin: EdgeInsets.symmetric(vertical: 6.0),
        color: isEnd
            ? Color.fromARGB(255, 97, 97, 97)
            : Color.fromARGB(255, 11, 9, 44),
        child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onLongPress: () => _showDeleteDialog(
                context, medicine.name, medicine.id, medicine.notifyId),
            onTap: () => _dispMedInfo(context),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            title: Text(
              medicine.name,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20.0,
                  decoration: isEnd ? TextDecoration.lineThrough : null),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              isEnd
                  ? "${medicine.amount} ${medicine.medicineForm} Taken"
                  : "${medicine.amount} ${medicine.medicineForm} Yet to take",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: const Color.fromARGB(255, 202, 202, 202),
                  fontSize: 15.0,
                  decoration: null),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat("HH:mm").format(
                      DateTime.fromMillisecondsSinceEpoch(medicine.time)),
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      decoration: isEnd ? TextDecoration.lineThrough : null),
                ),
              ],
            ),
            leading: Container(
              width: 60.0,
              height: 60.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        isEnd ? Colors.white : Colors.transparent,
                        BlendMode.saturation),
                    child: Image.asset(medicine.image)),
              ),
            )));
  }

  //--------------------------| SHOW THE DELETE DIALOG ON THE SCREEN |-----------------------
  void _showDeleteDialog(
      BuildContext context, String medicineName, int medicineId, int notifyId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Delete ?"),
              content: Text("Are you sure to delete $medicineName medicine?"),
              contentTextStyle:
                  TextStyle(fontSize: 17.0, color: Colors.grey[800]),
              actions: [
                TextButton(
                  //splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  //splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
                  child: Text("Delete",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  onPressed: () async {
                    await Repository().deleteData('Pills', medicineId);
                    await Notifications().removeNotify(
                        notifyId, flutterLocalNotificationsPlugin);
                    setData();
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }

  void _dispMedInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayMedInfo(medicine: medicine),
      ),
    );
  }

  //============================================================================================
}
