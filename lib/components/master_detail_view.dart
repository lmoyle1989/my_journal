import 'package:flutter/material.dart';
import 'entry_detail_view.dart';
import 'entry_list_view_stateless.dart';

class MasterDetailView extends StatelessWidget {
  const MasterDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: EntryListViewStateless()),
          Expanded(child: EntryDetailView()),
        ],
      ),
    );
  }
}
