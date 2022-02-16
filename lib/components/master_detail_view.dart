import 'package:flutter/material.dart';
import 'entry_detail_view.dart';
import 'entry_list_view.dart';

class MasterDetailScreen extends StatelessWidget {
  const MasterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: ListViewScreen()),
          const Expanded(child: EntryDetailView()),
        ],
      ),
    );
  }
}
