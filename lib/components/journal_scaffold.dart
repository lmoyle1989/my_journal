import 'package:flutter/material.dart';
import 'package:my_journal/screens/settings_screen.dart';

class JournalScaffold extends StatelessWidget {
  const JournalScaffold({
    Key? key,
    required this.title,
    this.actionButton,
    required this.body,
    this.horizontalBody,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Widget? horizontalBody;
  final FloatingActionButton? actionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
        actions: [
          Builder(builder: (context) {
            return IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                });
          }),
        ],
      ),
      endDrawer: const SettingsScreen(),
      floatingActionButton: actionButton,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          if (horizontalBody != null) {
            return horizontalBody ?? body;
          } else {
            return body;
          }
        } else {
          return body;
        }
      }),
    );
  }
}
