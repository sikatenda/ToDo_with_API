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
  // My todo list
  late Future<List<Todo>> futureTodos;

  @override
  void initState() {
    super.initState();

    futureTodos = Apiservice().fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floating button
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            //addDialog(context);
            // await Apiservice().fetchTodos();
          },
          child: const Icon(Icons.refresh)),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Center(child: Text('List')),
      ),
      body: FutureBuilder<List<Todo>>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            final todos = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    todos[index].title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(todos[index].completed.toString()),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete)),
                ));
              },
            );
          }

          // By default, show a loading spinner.
        },
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
