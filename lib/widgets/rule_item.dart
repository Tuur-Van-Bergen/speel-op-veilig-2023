import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:speel_op_veilig/util.dart';

class RuleItem extends StatelessWidget {
  final String? text;
  final String? why;

  const RuleItem({Key? key, required this.text, required this.why})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(children: [
          Flexible(
              fit: FlexFit.tight,
              child: MarkdownBody(
                  data: text ?? '', onTapLink: linkHandler(context))),
          why == null || why!.isEmpty
              ? Container()
              : IconButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                            title: Text('Waarom?',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            contentPadding: const EdgeInsets.only(
                                top: 10, right: 25, bottom: 25, left: 25),
                            children: [Text(why!)],
                          )),
                  icon: const Icon(Icons.question_mark),
                  iconSize: 16,
                  splashRadius: 24)
        ]));
  }
}
