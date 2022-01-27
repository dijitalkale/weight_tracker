import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart'; //tarih formatı için eklendi
import 'package:numberpicker/numberpicker.dart';
import "package:get/get.dart";
import 'package:weight_tracker/Models/record_Model/firestore_db.dart';
import 'package:weight_tracker/Models/record_Model/recordModel.dart';
import 'package:weight_tracker/Views/historyPage/history_view.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({Key? key}) : super(key: key);

  @override
  _AddRecordViewState createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _secilenDeger = 70;
  DateTime _secilenTarih = DateTime.now();
  String _notEkle = "";
  final TextEditingController _noteText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Kayıt".tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(FontAwesomeIcons.weight, size: 50),
                  // stack widgeti sayının altına çizilen ücgen için yaptık ekrana şekil çizip yerleştirmeye yarar
                  Stack(
                      // okun konumunu burda veriyoruz
                      alignment: Alignment.bottomCenter,
                      children: [
                        NumberPicker(
                          itemCount: 3,
                          itemWidth: 80,
                          itemHeight: 50,
                          step: 1,
                          axis: Axis.horizontal,
                          minValue: 40,
                          maxValue: 500,
                          value: _secilenDeger,
                          onChanged: (value) {
                            setState(() {
                              _secilenDeger = value;
                            });
                          },
                          // secilien kutucuğu bu alanda yaptık
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                        // ok için bu kısımda işlem yapıyorz 2. çocuğu
                        const Icon(
                          FontAwesomeIcons.chevronUp,
                          size: 16,
                        )
                      ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              // date picker görünecek ve secili tarih atanacak
              _secilenTarih = await showDatePicker(
                      context: context,
                      initialDate: (DateTime.now()),
                      firstDate: DateTime(1000),
                      lastDate: DateTime(2200),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.dark(),
                          child: child ?? Text("".tr),
                        );
                      }) ??
                  _secilenTarih; //iki soru işareti eğer boş ise kendisine tekrar eşitledik
              setState(() {});
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      FontAwesomeIcons.calendar,
                      size: 50,
                    ),
                    Expanded(
                      child: Text(
                        // DateFormat("EEE MMM d").format(_secilenTarih),
                        DateFormat.yMMMMEEEEd().format(_secilenTarih),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(FontAwesomeIcons.bookOpen, size: 50),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: _noteText,
                        maxLength: 27,
                        // keyboardType: TextInputType.multiline,
                        // autofocus: false,
                        onEditingComplete: () {
                          _noteText.text;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                onPressed: () async {
                  // gelen dataları yazıyoruz
                  final recordModel = RecordModel(
                    name: "ibrahim KÖSE (static value)",
                    content: _noteText.text.trim(),
                    tarih: _secilenTarih,
                    kilo: _secilenDeger,
                    isDone: true,
                  );
                  // kaydet çağırıp kayıt başarılıysa yönlendiriyoruz sayfayı
                  await FirestoreDb.setRecord(recordModel);
                  recordModel != null
                      ? Get.to(() => const HistoryScreen())
                      : _noteText.text = _noteText.text;
                },
                child: const Text("Ekle"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: const Size(500, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
