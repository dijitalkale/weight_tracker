import 'package:cloud_firestore/cloud_firestore.dart';

class RecordModel {
  String? id;
  String? name;
  late DateTime tarih;
  late int kilo;
  late String content;
  late Timestamp createdon;
  late bool isDone;

  RecordModel({
    this.id,
    this.name,
    required this.kilo,
    required this.content,
    // required this.createdon,
    required this.isDone,
    required this.tarih,
  });

  RecordModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc['name'];
    kilo = doc['kilo'];
    tarih = doc['tarih'];
    content = doc['content'];
    createdon = doc['createdon'];
    isDone = doc['isDone'];
  }
}
