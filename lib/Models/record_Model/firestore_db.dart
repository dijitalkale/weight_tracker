import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker/Constants/firebaseConstants.dart';
import 'package:weight_tracker/Models/record_Model/recordModel.dart';

class FirestoreDb {
  // add yöntemi ile id yi içeri aktaramıyoruz.
  static addRecord(RecordModel recordmodel) async {
    await firebaseFirestore.collection('wtdb').add({
      // 'id': recordmodel.id,//id yi kapattığında otomatik id veriyor(Record Model de atama yaptık)
      'name': recordmodel.name,
      'tarih': recordmodel.tarih,
      'content': recordmodel.content,
      'kilo': recordmodel.kilo,
      'createdon': Timestamp.now(),
      'isDone': recordmodel.isDone,
    });
  }

// set işlemi tüm datayı değiştirir gönderdiğin yoksa da yeniden oluşturur. eksik data giderse kalan kısmı siler
  static setRecord(RecordModel recordmodel) async {
    final recordSave = firebaseFirestore.collection('wtdb').doc();
    final json = {
      "id": recordSave.id, //id yi otomatik olması için yapıldı
      'name': recordmodel.name,
      'tarih': recordmodel.tarih,
      'content': recordmodel.content,
      'kilo': recordmodel.kilo,
      'createdon': Timestamp.now(),
      'isDone': recordmodel.isDone,
    };

    await recordSave.set(json);
  }

// conlı yayın akışı sağlar record modelini dinleyerek 
  static Stream<List<RecordModel>> recordStream() {
    return firebaseFirestore
        .collection('wtdb')
        .snapshots()
        .map((QuerySnapshot query) {
      List<RecordModel> records = [];
      for (var record in query.docs) {
        final recordModel = RecordModel.fromDocumentSnapshot(record);
        records.add(recordModel);
      }
      return records;
    });
  }

// yeniden yapılandırır gelen datayı
  static updateStatus(
      documentId, bool isDone, String content, String name, int kilo) {
    firebaseFirestore.collection('wtdb').doc(documentId).update(
      {
        'kilo': kilo,
        'name': name,
        'content': content,
        'isDone': isDone,
      },
    );
  }

// tüm datayı siler
  static deleteRecords(String documentId) {
    firebaseFirestore.collection('wtdb').doc(documentId).delete();
  }
}
