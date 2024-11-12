class Pill {
  int id;
  String name;
  String amount;
  String type;
  int howManyWeeks;
  String description;
  String medicineForm;
  int time;
  int notifyId;

  Pill(
      {required this.id,
      required this.howManyWeeks,
      required this.time,
      this.description = '',
      required this.amount,
      required this.medicineForm,
      required this.name,
      required this.type,
      required this.notifyId});

  //------------------set pill to map-------------------

  Map<String, dynamic> pillToMap() {
    Map<String, dynamic> map = Map();
    map['id'] = this.id;
    map['name'] = this.name;
    map['amount'] = this.amount;
    map['type'] = this.type;
    map['howManyWeeks'] = this.howManyWeeks;
    map['medicineForm'] = this.medicineForm;
    map['time'] = this.time;
    map['notifyId'] = this.notifyId;
    return map;
  }

  //=====================================================

  //---------------------create pill object from map---------------------
  Pill pillMapToObject(Map<String, dynamic> pillMap) {
    return Pill(
        id: pillMap['id'],
        name: pillMap['name'],
        amount: pillMap['amount'],
        type: pillMap['type'],
        howManyWeeks: pillMap['howManyWeeks'],
        medicineForm: pillMap['medicineForm'],
        time: pillMap['time'],
        notifyId: pillMap['notifyId']);
  }
//=====================================================================

  //---------------------| Get the medicine image path |-------------------------
  String get image {
    switch (this.medicineForm) {
      case "Syrup":
        return "assets/images/syrup.png";

      case "Tablets":
        return "assets/images/pills.png";

      case "Capsule":
        return "assets/images/capsule.png";

      case "Cream":
        return "assets/images/cream.png";
      case "Drops":
        return "assets/images/drops.png";

      case "Syringe":
        return "assets/images/syringe.png";

      default:
        return "assets/images/pills.png";
    }
  }
  //=============================================================================
}
