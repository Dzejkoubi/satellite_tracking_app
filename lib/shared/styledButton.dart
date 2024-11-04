import 'package:flutter/cupertino.dart';

class StyledCupertinoTextButton extends StatelessWidget {
  const StyledCupertinoTextButton(
      {required this.child, required this.onPressed, super.key});

  final Widget child;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(onPressed: onPressed, child: child);
  }
}

class StyledCupertinoIconButton extends StatelessWidget {
  const StyledCupertinoIconButton(this.iconSize,
      {required this.icon, required this.onPressed, super.key});

  final IconData icon;
  final void Function() onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      pressedOpacity: 0.5,
      child: Icon(
        icon,
        size: iconSize,
      ),
    );
  }
}

class StyledCupertinoToggleButton extends StatelessWidget {
  const StyledCupertinoToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
