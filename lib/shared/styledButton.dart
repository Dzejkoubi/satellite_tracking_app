import 'package:flutter/cupertino.dart';

class TextButtonStyledCupertino extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const TextButtonStyledCupertino(
      {required this.child, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: const CupertinoDynamicColor.withBrightness(
          color: CupertinoColors.lightBackgroundGray,
          darkColor: CupertinoColors.darkBackgroundGray),
      child: child,
    );
  }
}

class IconButtonStyledCupertino extends StatelessWidget {
  const IconButtonStyledCupertino(this.iconSize,
      {required this.icon, required this.onPressed, super.key});

  final IconData icon;
  final void Function() onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        size: iconSize,
      ),
    );
  }
}

class ToggleButtonStyledCupertino extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onToggle;

  const ToggleButtonStyledCupertino({
    Key? key,
    required this.value,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: (bool newValue) {
        onToggle(newValue);
        print(newValue);
      },
    );
  }
}
