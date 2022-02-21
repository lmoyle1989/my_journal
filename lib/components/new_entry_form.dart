import 'package:flutter/material.dart';

class NewEntryForm extends StatefulWidget {
  const NewEntryForm({Key? key}) : super(key: key);

  @override
  _NewEntryFormState createState() => _NewEntryFormState();
}

class _NewEntryFormState extends State<NewEntryForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Body",
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Rating",
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}
