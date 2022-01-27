import 'package:get/get.dart';
import 'package:weight_tracker/Models/record_Model/record.dart';

class RecordsController extends GetxController {
  var records = <Record>[
    Record(weight: 80, dateTime: DateTime.now(), note: "ABC"),
    Record(weight: 81, dateTime: DateTime.now(), note: "ABC"),
    Record(weight: 82, dateTime: DateTime.now(), note: "ABC"),
    Record(weight: 83, dateTime: DateTime.now(), note: "ABC"),
    Record(weight: 84, dateTime: DateTime.now(), note: "ABC"),
    Record(weight: 85, dateTime: DateTime.now(), note: "ABC"),
  ].obs;

  void addRecord(weight, dateTime, note) {
    records.add(Record(weight: weight, dateTime: dateTime, note: note));
  }

  void removeRecord(Record record) {
    records.remove(record);
  }

  void updateRecord(Record record) {
    // records.update(record);
  }
}
