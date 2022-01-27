import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; //tarih için eklendi format
import 'package:weight_tracker/Controllers/recordsController.dart/getXrecordsController.dart';
import 'package:weight_tracker/Models/record_Model/record.dart';

class RecordListTile extends StatelessWidget {
  final Record record;
  RecordListTile({Key? key, required this.record}) : super(key: key);
  final RecordsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListTile(
          leading: _buildDateTimeTextMethod(),
          title: _buildWeightCenterMethod(),
          trailing: _buildIconRowMethod(),
        ),
      ),
    );
  }

  Row _buildIconRowMethod() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
          color: Colors.grey,
        ),
        IconButton(
          onPressed: () {
            _controller.removeRecord(record);
          },
          icon: const Icon(Icons.delete),
          color: Colors.red,
        ),
      ],
    );
  }

  Center _buildWeightCenterMethod() {
    return Center(
        child: Text(record.weight.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
  }

  Text _buildDateTimeTextMethod() =>
      Text(DateFormat("EEE, MMM d").format(record.dateTime));
}
