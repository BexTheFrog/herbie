import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:menu_negacao/pages/home_page.dart';
import 'package:menu_negacao/pages/pomodoro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Negação',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final isDialOpen = ValueNotifier(false);

  final Color mainColor = Color.fromRGBO(93, 87, 107, 1);

  final items = <Widget>[
    const Icon(Icons.home_filled, size: 30),
    const Icon(Icons.search, size: 30),
    const Icon(Icons.timer, size: 30),
    const Icon(Icons.person, size: 30),
  ];

  late final screens = [
    HomePage(),
    const Center(
      child: Text(
        "Search",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    ),
    PomodoroPage(),
    // ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.white,
            body: screens[index],
            bottomNavigationBar: Theme(
              data: Theme.of(
                context,
              ).copyWith(iconTheme: const IconThemeData(color: Colors.white)),
              child: CurvedNavigationBar(
                buttonBackgroundColor: Colors.purple,
                color: mainColor,
                backgroundColor: Colors.transparent,
                animationDuration: const Duration(milliseconds: 500),
                index: index,
                items: items,
                onTap: (newIndex) {
                  setState(() {
                    index = newIndex;
                  });
                },
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpeedDial(
                icon: Icons.add,
                backgroundColor: Color.fromRGBO(93, 87, 107, 1),
                overlayColor: Color.fromRGBO(93, 87, 107, 1),
                overlayOpacity: 0.5,
                spacing: 10,
                spaceBetweenChildren: 8,
                openCloseDial: isDialOpen,
                children: [
                  SpeedDialChild(
                    child: const Icon(Icons.note_add),
                    backgroundColor: Colors.red,
                    label: "Adiciona nota",
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.pets),
                    backgroundColor: Color.fromRGBO(93, 87, 107, 1),
                    label: "Pet",
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.settings),
                    backgroundColor: Colors.blue,
                    label: "Configurações",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
