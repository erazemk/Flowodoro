import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  bool _isRunning = false;
  int _stopwatchText = 0;

  void _switchTimerState() {
    setState(() {
      _isRunning = !_isRunning;

      // Restart stopwatch
      if (_isRunning) {
        _stopwatchText = 0;
      }
    });

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!_isRunning) {
        timer.cancel();
      } else {
        setState(() {
          _stopwatchText++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_stopwatchText',
                style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: _switchTimerState,
              child: Text(_isRunning ? 'Stop' : 'Start'),
            ),
          ],
        ),
      ),
    );
  }
}
