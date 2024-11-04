import 'package:flutter/cupertino.dart';

class StyledTextButton extends StatelessWidget {
  const StyledTextButton(
      {required this.child, required this.onPressed, super.key});

  final Widget child;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }
}

class StyledIconButton extends StatelessWidget {
  const StyledIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
