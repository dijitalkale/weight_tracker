import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/Views/graphPage/graph_view.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:weight_tracker/Views/historyPage/add_records_firebase.dart';
import 'package:weight_tracker/Views/historyPage/history_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTabe = 0;
  Widget _currentScreen = const GraphyScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("TRACK YOUR WEIGHT")),
      // body: const HistoryScreen(),
      // hangi sayfanını geleceğini değişken ile bildirdik
      body: _currentScreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // getX ile + ya basınca sayfa yönlendirmesi yaptık
          Get.to(() => const AddRecordView());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        // height getx ile gelen özellik sayfanın 12 de 1 kadar yükselsin dedik
        height: Get.height / 12,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        gapLocation: GapLocation.center,
        backgroundColor: Colors.black,
        icons: const [Icons.show_chart, Icons.history],
        iconSize: 30,
        activeIndex: _currentTabe,
        onTap: (p0) {
          // sayfalar arasında geçiş ayarladık bottom bar da ki
          setState(() {
            _currentTabe = p0;
            // hangi sayfada hangisi olacak onu belirledik
            _currentScreen =
                (p0 == 0) ? const GraphyScreen() : const HistoryScreen();
          });

          // print(p0);
        },
      ),
    );
  }
}
