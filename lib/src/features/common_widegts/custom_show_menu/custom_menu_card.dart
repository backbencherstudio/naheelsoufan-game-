import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String?> customPopupMenu({
  required BuildContext context,
  required GlobalKey key,
  required Set<String> list,
  double? height,
}) async {
  final RenderBox renderBox =
  key.currentContext!.findRenderObject() as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero);

  final Size size = renderBox.size;

  final result = await showMenu<String>(
    context: context,
    color: Color(0xFFE0E0FF),
    elevation: 5,
    shadowColor: Colors.grey.withValues(alpha: 0.2),
    constraints: BoxConstraints(minWidth: 150.w, maxHeight:height?? 130.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    position: RelativeRect.fromLTRB(
      190.w,
      offset.dy + size.height,
      20.w,
      offset.dy,
    ),
    items: () {
      List<PopupMenuEntry<String>> menuItems = [];
      final areasList = list.toList();

      for (int i = 0; i < areasList.length; i++) {
        menuItems.add(
          PopupMenuItem(
            padding: EdgeInsets.zero,
            value: areasList[i],
            child: Center(
              child: Text(
                areasList[i],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFF3D4279)),
              ),
            ),
          ),
        );

        if (i < areasList.length - 1) {
          menuItems.add(const PopupMenuDivider(color: Color(0xFF3D4279)));
        }
      }
      return menuItems;
    }(),
  );

  return result;
}