import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF9F4E8),
        fontFamily: 'Arial',
      ),
      home: PomodoroPage(),
    );
  }
}

class PomodoroPage extends StatefulWidget {
  @override
  _PomodoroPageState createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  static const int focusTime = 25 * 60; // 25 minutos em segundos
  int remainingTime = focusTime;
  Timer? timer;
  bool isRunning = false;

  String get timeFormatted {
    int minutes = remainingTime ~/ 60;
    int seconds = remainingTime % 60;
    String minStr = minutes.toString().padLeft(2, '0');
    String secStr = seconds.toString().padLeft(2, '0');
    return "$minStr$secStr";
  }

  void startTimer() {
    if (timer != null && timer!.isActive) return;
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        setState(() {
          isRunning = false;
          remainingTime = focusTime;
        });
        // Você pode adicionar alguma notificação ou som aqui
      }
    });
  }

  void pauseTimer() {
    if (timer != null) {
      timer!.cancel();
      setState(() {
        isRunning = false;
      });
    }
  }

  void resetTimer() {
    pauseTimer();
    setState(() {
      remainingTime = focusTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // REMOVIDO bottomNavigationBar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEF6557),
        child: Icon(isRunning ? Icons.pause : Icons.play_arrow, size: 36),
        onPressed: () {
          if (isRunning) {
            pauseTimer();
          } else {
            startTimer();
          }
        },
      ),
      body: Column(
        children: [
          Container(
            height: 75,
            color: Color(0xFF5E586E),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.blur_on_outlined,
                    color: Color(0xFFF9F4E8),
                    size: 36,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F4E8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "15",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFEF6557),
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.monetization_on_outlined,
                          color: Color(0xFFEF6557),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFEF6557),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.memory_outlined, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Foco",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Text(
            timeFormatted,
            style: TextStyle(
              fontSize: 140,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8AA9A7),
              height: 1,
              letterSpacing: 4,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {}, // pode abrir menu ou opções
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC6C5A6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    minimumSize: Size(64, 64),
                  ),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.black54,
                    size: 30,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (isRunning) {
                      pauseTimer();
                    } else {
                      startTimer();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEF6557),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  ),
                  child: Icon(
                    isRunning ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                ElevatedButton(
                  onPressed: resetTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC6C5A6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    minimumSize: Size(64, 64),
                  ),
                  child: Icon(
                    Icons.fast_forward,
                    color: Colors.black54,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
