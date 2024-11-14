import 'package:cupertino_container/cupertino_container.dart';
import 'package:flutter/cupertino.dart';

class ButtonStyledCupertino extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const ButtonStyledCupertino(
      {required this.child, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoContainer(
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          const CupertinoDynamicColor.withBrightness(
            color: CupertinoColors.lightBackgroundGray,
            darkColor: CupertinoColors.darkBackgroundGray,
          ),
          context,
        ),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: child,
      ),
    );
  }
}

class ToggleButtonStyledCupertino extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onToggle;

  const ToggleButtonStyledCupertino(
      {required this.value, required this.onToggle, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: (bool newValue) {
        onToggle(newValue);
      },
    );
  }
}
