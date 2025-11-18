// ths page will display the record from the API
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class MyAll extends StatefulWidget {
  const MyAll({super.key});

  @override
  State<MyAll> createState() => _MyAllState();
}

class _MyAllState extends State<MyAll> {
  TextEditingController textEditingController = TextEditingController();
  List<String> tasks = ["studying", "coding", "cooking"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            addDialog(context);
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Center(child: Text('Tasks')),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(tasks[index]),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete)),
              ),
            );
          }),
    );
  }

  addDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New task"),
            content: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter new task"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      tasks.add(textEditingController.text);
                    });
                    textEditingController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Add")),
              TextButton(
                  onPressed: () {
                    textEditingController.clear();

                    Navigator.pop(context);
                  },
                  child: const Text("cancel")),
            ],
          );
        });
  }
}
