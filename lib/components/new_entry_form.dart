import 'package:flutter/material.dart';
import 'package:my_journal/models/entry_data.dart';

class NewEntryForm extends StatefulWidget {
  const NewEntryForm({Key? key}) : super(key: key);

  @override
  _NewEntryFormState createState() => _NewEntryFormState();
}

class _NewEntryFormState extends State<NewEntryForm> {
  final formKey = GlobalKey<FormState>();
  final List<int> ratingOptions = [1, 2, 3, 4];
  EntryData entryData = EntryData();

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
            onSaved: (value) {
              entryData.title = value;
            },
          ),
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Body",
              border: OutlineInputBorder(),
            ),
            onSaved: (value) {
              entryData.body = value;
            },
          ),
          DropdownButtonFormField<int>(
            value: entryData.rating,
            items: ratingOptions.map((int val) {
              return DropdownMenuItem(
                value: val,
                child: Text("$val"),
              );
            }).toList(),
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Rating",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                entryData.rating = value;
              });
            },
            onSaved: (value) {
              entryData.rating = value;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  formKey.currentState?.save();
                  Navigator.of(context).pop();
                },
                child: const Text("Save"),
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              )
            ],
          )
        ],
      ),
    );
  }
}
