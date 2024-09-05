import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tz_flutter_game/screens/game_page.dart';
import 'package:tz_flutter_game/uitls/game_assets.dart';
import 'package:tz_flutter_game/widgets/menu_btn.dart';

class DifficultyDialog extends StatefulWidget {
  const DifficultyDialog({super.key});

  @override
  State<DifficultyDialog> createState() => _DifficultyDialogState();
}

class _DifficultyDialogState extends State<DifficultyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 500.w,
        height: 400.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.sp),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              width: 350,
              height: 100,
              fontSize: 20,
              onTap: () {
                Get.to(
                  () => const GamePage(difficulty: 1),
                );
              },
              btnText: "Easy",
            ),
            MenuButton(
              width: 350,
              height: 100,
              fontSize: 20,
              onTap: () {
                Get.to(
                  () => const GamePage(difficulty: 2),
                );
              },
              btnText: "Medium",
            ),
            MenuButton(
              width: 350,
              height: 100,
              fontSize: 20,
              onTap: () {
                Get.to(
                  () => const GamePage(difficulty: 3),
                );
              },
              btnText: "Difficult",
            ),
          ],
        ),
      ),
    );
  }
}
