import 'package:flutter/material.dart';
import 'package:my_journal/components/list_entry.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({
    Key? key,
  }) : super(key: key);

  final items = List<Map<String, String>>.generate(100, (i) {
    return {'title': "Entry $i", 'subtitle': "Subtitle Text $i"};
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListEntry(
          title: items[index]['title'],
          subtitle: items[index]['subtitle'],
        );
      },
    );
  }
}
