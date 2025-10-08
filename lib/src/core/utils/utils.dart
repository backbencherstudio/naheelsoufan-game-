
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatTime(DateTime? time) {
    if (time != null) {
      return DateFormat('H:mm').format(time);
    }
    return '--';
  }

  static String formatLunchTime(DateTime? startTime, DateTime? endTime, bool isLunch) {
    if (startTime != null && endTime != null) {
      return '${DateFormat('H').format(startTime)}-${DateFormat('H').format(endTime)}';
    }
    return '--';
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 600;
  }
}
