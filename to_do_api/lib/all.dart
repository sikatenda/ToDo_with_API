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
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Center(child: Text('Tasks')),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tasks[index]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit))
                      ],
                    )
                  ],
                ),
                //trailing:
                // IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              ),
            );
          }),
    );
  }
}
