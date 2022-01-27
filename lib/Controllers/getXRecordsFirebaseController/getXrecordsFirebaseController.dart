import 'package:get/get.dart';
import 'package:weight_tracker/Models/record_Model/firestore_db.dart';
import 'package:weight_tracker/Models/record_Model/recordModel.dart';

class RecordController extends GetxController {
  Rx<List<RecordModel>> recordList = Rx<List<RecordModel>>([]);
  List<RecordModel> get records => recordList.value;

  @override
  void onReady() {
    recordList.bindStream(FirestoreDb.recordStream());
  }
}
