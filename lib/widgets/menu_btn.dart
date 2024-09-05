import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tz_flutter_game/uitls/game_assets.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onTap,
    required this.btnText,
    this.fontSize = 30,
    this.height = 200,
    this.width ,
  });
  final void Function() onTap;
  final String btnText;
  final double fontSize;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w,
        height: height?.h,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(GameAssets.menuBtn)),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
