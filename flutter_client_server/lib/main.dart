// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Listas de Times',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

// ignore: duplicate_ignore
class MyHomeState extends State<MyHome> {
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: deprecated_member_use, prefer_final_fields, prefer_collection_literals
  List<String> _tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Form(
                key: _formKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: taskController,
                        style: const TextStyle(
                            fontSize: 22, color: Colors.black87),
                        decoration: const InputDecoration(
                            hintText: 'Adicione um Time',
                            hintStyle: TextStyle(
                              fontSize: 20,
                            )),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Task field it\'s required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: RaisedButton(
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Add',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          debugPrint('CLIQUEI!!!');
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _tasks.add(taskController.text);
                            });
                            taskController.clear();
                          }
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_tasks[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
