import 'package:flutter/cupertino.dart';

class LargeTextStyledCupertino extends StatelessWidget {
  final String text;

  const LargeTextStyledCupertino({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
    );
  }
}

class ImportantTextStyledCupertino extends StatelessWidget {
  final String text;

  const ImportantTextStyledCupertino({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
            color: CupertinoColors.activeBlue,
          ),
    );
  }
}

class NormalTextStyledCupertino extends StatelessWidget {
  const NormalTextStyledCupertino({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.textStyle,
    );
  }
}
