import 'package:flutter/material.dart';
import '../../../../../../core/constant/icons.dart';
import '../home_widgets/custom_icons_Buttons.dart';

class CustomPopUpMenu extends StatefulWidget {
  const CustomPopUpMenu({super.key});

  @override
  State<CustomPopUpMenu> createState() => _CustomPopUpMenuState();
}

class _CustomPopUpMenuState extends State<CustomPopUpMenu> {
  final GlobalKey _buttonKey = GlobalKey(); // Key for positioning
  OverlayEntry? _overlayEntry;

  void _showPopupMenu(BuildContext context, Offset position) {
    _overlayEntry = OverlayEntry(
      builder:
          (_) => Stack(
            children: [
              // Tapping outside closes the popup
              GestureDetector(
                onTap: _removePopup,
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                left: position.dx - 18,
                top: position.dy + 40,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomIconsButtons(
                            icon: AppIcons.settings,
                            onTap: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomIconsButtons(
                            icon: AppIcons.sound,
                            onTap: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomIconsButtons(
                            icon: AppIcons.expandedICon,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removePopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomIconsButtons(
      key: _buttonKey,
      icon: AppIcons.threeDot,
      onTap: () {
        final renderBox =
            _buttonKey.currentContext?.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          _showPopupMenu(context, position);
        }
      },
    );
  }
}
