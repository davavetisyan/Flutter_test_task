import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tz_flutter_game/widgets/difficulty_dialog.dart';
import 'package:tz_flutter_game/widgets/menu_btn.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MenuButton(
              onTap: () {
                Get.dialog(
                  const DifficultyDialog(),
                );
              },
              btnText: 'Start',
              width: 300,
            ),
            MenuButton(
              onTap: () {
                exit(0);
              },
              width: 300,
              btnText: 'EXIT',
            ),
          ],
        ),
      ),
    );
  }
}
