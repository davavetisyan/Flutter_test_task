import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:tz_flutter_game/models/game_item.dart';
import 'package:tz_flutter_game/models/timer_model.dart';
import 'package:tz_flutter_game/uitls/game_assets.dart';
import 'package:tz_flutter_game/widgets/game_item_widget.dart';

class GamePage extends StatefulWidget {
  final int difficulty;
  const GamePage({super.key, required this.difficulty});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int gridElemsCount = 0;
  List<GameItem> items = [];

  @override
  void initState() {
    switch (widget.difficulty) {
      case 1:
        gridElemsCount = 4;
        break;
      case 2:
        gridElemsCount = 5;
        break;
      case 3:
        gridElemsCount = 6;
        break;
    }

    for (int i = 0; i < (gridElemsCount - 1) * (gridElemsCount - 1); ++i) {
      items.add(GameItem());
    }

    super.initState();
  }

  final CountDownTimer timer = CountDownTimer()
    ..init(Duration(seconds: 180))
    ..startTimer();

  @override
  Widget build(BuildContext context) {
    int horizontalPadd = 0;
    int verticalPadd = 0;

    switch (widget.difficulty) {
      case 1:
        gridElemsCount = 4;
        horizontalPadd = 80;
        verticalPadd = 137;
        break;
      case 2:
        gridElemsCount = 5;
        horizontalPadd = 57;
        verticalPadd = 107;
        break;
      case 3:
        gridElemsCount = 6;
        horizontalPadd = 21;
        verticalPadd = 77;
        break;
    }
    int itemIndex = 0;

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: 812.h,
        width: 375.w,
        child: Column(
          children: [
            Image.asset(
              GameAssets.top,
              width: 375.w,
              height: 157.h,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: verticalPadd.h, horizontal: horizontalPadd.w),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: gridElemsCount * gridElemsCount,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridElemsCount,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return SizedBox(
                        width: 42.w,
                        height: 42.h,
                      );
                    }

                    if (index % gridElemsCount == 0 || index < gridElemsCount) {
                      return SizedBox(
                        width: 42.w,
                        height: 42.h,
                        child: Image.asset(
                          GameAssets.figure1,
                          fit: BoxFit.cover,
                        ),
                      );
                    }

                    return GameItemWidget(
                      item: items[itemIndex++],
                    );
                  },
                ),
              ),
            ),
            Container(
                width: 375.w,
                height: 157.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      GameAssets.bottom,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 179.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffCC620C),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 4.h),
                      child: Row(
                        children: [
                          Text(
                            'timer',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 18.sp,
                            ),
                          ),
                          const Spacer(),
                          StreamBuilder<TimerModel>(
                            initialData: TimerModel(time: '03:00', percent: 1),
                            stream: timer.stream(),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              TimerModel timerModel = snapshot.hasData
                                  ? snapshot.data
                                  : TimerModel(time: '03:00', percent: 1);
                              return Text(
                                timerModel.time,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          items.forEach((item) => item.currentCount = 1);
                        });
                      },
                      child: Image.asset(
                        GameAssets.restartBtn,
                        width: 179.w,
                        height: 44.h,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
