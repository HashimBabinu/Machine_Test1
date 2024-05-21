import 'dart:async';

import 'package:flutter/material.dart';

class timer extends StatefulWidget {
  const timer({super.key});

  @override
  State<timer> createState() => _timerState();
}

class _timerState extends State<timer> {
   Timer? _timer;
  int _start = 0;
  
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer?.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Timer')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_start',),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_timer == null || !_timer!.isActive) {
                  setState(() {
                    _start = 10;  
                  });
                  startTimer();
                }
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );

  }
}