// ths page will display the record from the API
import 'package:flutter/material.dart';
import 'package:to_do_api/model.dart';
import 'package:to_do_api/service.dart';

//import 'package:http/http.dart' as http;

class MyAll extends StatefulWidget {
  const MyAll({super.key});

  @override
  State<MyAll> createState() => _MyAllState();
}

class _MyAllState extends State<MyAll> {
  TextEditingController textEditingController = TextEditingController();

  late Future<Todos> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = fetchTodos();
  }

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
      body: Center(
        child: FutureBuilder<Todos>(
          future: futureTodos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
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
                      //tasks.add(textEditingController.text);
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
/*

List<String> tasks = ["studying", "coding", "cooking"];

ListView.builder(
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

*/
