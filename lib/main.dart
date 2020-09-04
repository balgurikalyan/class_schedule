
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/application/cubit/launchzoom_cubit.dart';
import 'package:schedule/schedule.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LaunchzoomCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSE A',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int today;
  PageController dateController, pageController;
  ValueNotifier<int> refreshDates = ValueNotifier(0);

  @override
  void initState() {
    today = ((Schedule.getToday() - 1));
    dateController = PageController(viewportFraction: 0.4, initialPage: today);
    pageController = PageController(viewportFraction: 0.7, initialPage: today);

    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocListener<LaunchzoomCubit, LaunchzoomState>(
          listener: (context, state) {
            if (state is LaunchzoomFailed) {
              showDialog(
                  context: context,
                  child: Wrap(
                    children: [
                      const Text("Failed to launch"),
                      RaisedButton(
                        child: const Text("OK"),
                        onPressed: () {
                          BlocProvider.of<LaunchzoomCubit>(context)
                              .restoreStates();
                        },
                      )
                    ],
                  ),
                  barrierDismissible: false);
            }
          },
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: dateController,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ValueListenableBuilder(
                        valueListenable: refreshDates,
                        builder: (context, value, _) {
                          double size = 20;
                          int colorAlpha = 70;
                          if (index == today) {
                            size = 28;
                            colorAlpha = 255;
                          }

                          return Center(
                            child: AnimatedDefaultTextStyle(
                              style: TextStyle(
                                  fontSize: size,
                                  color: Color.fromARGB(colorAlpha, 0, 0, 0),
                                  fontWeight: FontWeight.bold),
                              duration: const Duration(milliseconds: 400),
                              child: Schedule.getDate(index),
                            ),
                          );
                        },
                      );
                    },
                  )),
              Flexible(
                  flex: 3,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (i) async {
                      today = i;

                      refreshDates.value = today;
                      await dateController.animateToPage(i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                          animation: pageController,
                          builder: (context, child) {
                            double scale = 0.85;
                            if (index == today) scale = 1.0;

                            return TweenAnimationBuilder(
                              tween: Tween<double>(begin: 0.85, end: scale),
                              duration: const Duration(milliseconds: 250),
                              builder: (context, double val, child) {
                                return Transform.scale(
                                    scale: val, child: child);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    color: Colors.blue,
                                    child: Center(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            Schedule.timeTable[index].length,
                                        itemBuilder: (context, i) {
                                          return GestureDetector(
                                            onTapDown: (details) {
                                                  String u = Schedule.timeTable[index][i];

                                          
                                              BlocProvider.of<LaunchzoomCubit>(
                                                      context)
                                                  .launchZoom(Schedule.getURL(u));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Center(
                                                child: Text(
                                                  Schedule.timeTable[index][i],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ))
            ],
          )),
    ));
  }
}
