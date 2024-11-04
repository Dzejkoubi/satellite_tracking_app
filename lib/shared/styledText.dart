import 'package:flutter/cupertino.dart';

class LargeTextStyled extends StatelessWidget {
  const LargeTextStyled({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
    );
  }
}

class ImportantTextStyled extends StatelessWidget {
  const ImportantTextStyled({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
    );
  }
}

class NormalTextStyled extends StatelessWidget {
  const NormalTextStyled({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.textStyle,
    );
  }
}
