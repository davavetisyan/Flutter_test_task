import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tz_flutter_game/models/game_item.dart';

class GameItemWidget extends StatefulWidget {
  GameItemWidget({super.key, required this.item});
  GameItem item;

  @override
  State<GameItemWidget> createState() => _GameItemWidgetState();
}

class _GameItemWidgetState extends State<GameItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.item.nextNumber();
        });
      },
      child: Container(
        width: 42.w,
        height: 42.h,
        child: Image.asset(
          widget.item.getAssetViaCount(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
