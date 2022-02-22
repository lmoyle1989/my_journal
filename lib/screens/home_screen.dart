import 'package:flutter/material.dart';
import 'package:my_journal/components/entry_list_view.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import 'package:my_journal/screens/entry_detail_screen.dart';
import '../components/master_detail_view.dart';
import 'new_entry_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget myBody = EntryListView(
    key: UniqueKey(),
  );

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "List of Journal Entries",
      actionButton: newEntryButton(context),
      body: myBody,
      horizontalBody: const MasterDetailView(),
    );
  }

  void resetListView() {
    setState(() {
      myBody = EntryListView(
        key: UniqueKey(),
      );
    });
  }

  void pushNewEntryScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(NewEntryScreen.routeName)
        .then((value) => resetListView());
  }

  FloatingActionButton newEntryButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        pushNewEntryScreen(context);
      },
      child: const Text("+"),
    );
  }
}
