import 'package:flutter/material.dart';
import 'package:my_journal/models/journal_entry.dart';
import 'package:sqflite/sqflite.dart';

class NewEntryForm extends StatefulWidget {
  const NewEntryForm({Key? key}) : super(key: key);

  @override
  _NewEntryFormState createState() => _NewEntryFormState();
}

class _NewEntryFormState extends State<NewEntryForm> {
  final formKey = GlobalKey<FormState>();
  final List<int> ratingOptions = [1, 2, 3, 4];
  JournalEntry entryData = JournalEntry();

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
                onPressed: () async {
                  formKey.currentState?.save();
                  entryData.date = DateTime.now();
                  String schema = await DefaultAssetBundle.of(context)
                      .loadString('assets/schema_1.txt');

                  final Database database = await openDatabase(
                    'journal.sqlite3.db',
                    version: 1,
                    onCreate: (Database db, int version) async {
                      await db.execute(schema);
                    },
                  );

                  await database.transaction((txn) async {
                    await txn.rawInsert(
                      'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?);',
                      [
                        entryData.title,
                        entryData.body,
                        entryData.rating,
                        entryData.date.toString()
                      ],
                    );
                  });

                  await database.close();
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
