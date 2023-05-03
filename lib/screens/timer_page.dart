import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  static Duration initialDuration = const Duration(seconds: 0);
  int hour = initialDuration.inHours;
  int minute = initialDuration.inMinutes;
  int second = initialDuration.inSeconds;
  Timer? timerFunc;
  bool isTimerRunning = false;

  startTimer() {
    timerFunc = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int newSecond = initialDuration.inSeconds + 1;
        initialDuration = Duration(seconds: newSecond);
        second = initialDuration.inSeconds.remainder(60);
        minute = initialDuration.inMinutes.remainder(60);
        hour = initialDuration.inHours.remainder(60);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 7.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        hour.toString().padLeft(2, "0"),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 65.0,
                            color: Colors.black,
                            letterSpacing: 7.0),
                      ),
                    ),
                   const SizedBox(height: 20.0,),
                   const  Text(
                      "Hours",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 5.0,
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 7.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        minute.toString().padLeft(2, "0"),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 65.0,
                            color: Colors.black,
                            letterSpacing: 7.0),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    const Text(
                      "Minutes",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 3.0,
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 7.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        second.toString().padLeft(2, "0"),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 65.0,
                            color: Colors.black,
                            letterSpacing: 7.0),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    const Text(
                      "Seconds",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),

                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            isTimerRunning
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  const SizedBox(width: 20.0,),
                      ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(120.0, 45.0)),
                              backgroundColor: timerFunc!.isActive
                                  ? MaterialStateProperty.all(Colors.red)
                                  : MaterialStateProperty.all(
                                      Colors.blueAccent),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10.0)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              alignment: Alignment.center),
                          onPressed: () {
                            setState(() {
                              if (timerFunc!.isActive) {
                                timerFunc!.cancel();
                              } else {
                                startTimer();
                              }
                            });
                          },
                          child: Text(
                            timerFunc!.isActive ? "Stop" : "Resume",
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      const SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(120.0, 45.0)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10.0)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              alignment: Alignment.center),
                          onPressed: () {
                            setState(() {
                              timerFunc!.cancel();
                              second = 0;
                              minute = 0;
                              hour = 0;
                              initialDuration = const Duration(seconds: 0);
                              isTimerRunning = false;
                            });
                          },
                          child: const Text(
                            "Cansel",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ],
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(180.0, 45.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                        alignment: Alignment.center),
                    onPressed: () {
                      startTimer();
                      setState(() {
                        isTimerRunning = true;
                      });
                    },
                    child: const Text(
                      "Start Timer",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
