import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/Controllers/recordsController.dart/getXrecordsController.dart';
import 'package:weight_tracker/Models/record_Model/record.dart';
import 'package:weight_tracker/Widgets/record_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final RecordsController _controller = Get.put(RecordsController());

  @override
  Widget build(BuildContext context) {
    // _controller.records yerine records yazabilmek için ekledik aşağıdaki değişkeni (refaktor yaptık)
    List<Record> records = _controller.records;
    // Obx ile sardık çünkü stream data akışını sağlıyor getx içinde
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("History"),
        ),
        // burada eğer data yoksa ekranda data gir dedik varsa listelesin istedik
        body: records.isEmpty
            ? const Center(
                child: Text("Lütfen Bir Data Girişi Yapiniz."),
              )
            : ListView(
                // android de aşağı yukarı çekmeyi etkinleştiriyor ios gibi
                // physics: const BouncingScrollPhysics(),
                children: records
                    .map(
                      (element) => RecordListTile(record: element),
                    )
                    .toList(), //Liste metodu ile çalışınca map ile iterible türü döner o yüzden listeye çeviyirioz
              ),
      ),
    );
  }
}
