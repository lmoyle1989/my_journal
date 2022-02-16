import 'package:flutter/material.dart';
import 'entry_detail_screen.dart';
import 'list_view_screen.dart';

class MasterDetailScreen extends StatelessWidget {
  const MasterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Expanded(child: ListViewScreen()),
        const Expanded(child: EntryDetailScreen()),
      ],
    ));
  }
}
