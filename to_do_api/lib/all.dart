// ths page will display the record from the API
import 'package:flutter/material.dart';

class MyAll extends StatefulWidget {
  const MyAll({super.key});

  @override
  State<MyAll> createState() => _MyAllState();
}

class _MyAllState extends State<MyAll> {
  List<String> tasks = ["studying", "coding", "cooking"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {},
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
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              ),
            );
          }),
    );
  }
}
