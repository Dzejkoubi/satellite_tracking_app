import 'package:flutter/cupertino.dart';

class StyledCupertinoLargeText extends StatelessWidget {
  const StyledCupertinoLargeText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
    );
  }
}

class StyledCupertinoImportantText extends StatelessWidget {
  const StyledCupertinoImportantText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
    );
  }
}

class StyledCupertinoNormalText extends StatelessWidget {
  const StyledCupertinoNormalText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.textStyle,
    );
  }
}
