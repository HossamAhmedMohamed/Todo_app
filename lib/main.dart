 // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_tasks_app/widgets/counter.dart';
import 'package:todo_tasks_app/widgets/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: todotasks(),
    );
  }
}

class todotasks extends StatefulWidget {
  const todotasks({super.key});

  @override
  State<todotasks> createState() => _todotasksState();
}

class task {
  String title;
  bool status;

  task({
    required this.title,
    required this.status,
  });
}

class _todotasksState extends State<todotasks> {
  myFunc() {
    setState(() {
      if (myController.text == "") {
        return;
      } else {
        allTasks.add(task(title: myController.text, status: false));
      }
    });
  }

  changeStatus(int theIndex) {
    setState(() {
      allTasks[theIndex].status = !allTasks[theIndex].status;
    });
  }

  deleteTasks(int theIndex) {
    setState(() {
      allTasks.remove(allTasks[theIndex]);
    });
  }

  deleteAllTasks() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  editTasks(int theIndex, String newText) {
    setState(() {
      if (newText == "") {
        return;
      } else {
        allTasks[theIndex].title = newText;
      }
    });
  }

  int calculateCompletedTasks() {
    int completedTasks = 0;

    allTasks.forEach((item) {
      if (item.status) {
        completedTasks++;
      }
    });

    return completedTasks;
  }

  List allTasks = [];
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(22),
                  color: Colors.white,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                         controller: myController,
                          maxLength: 20,
                          decoration:
                              InputDecoration(hintText: "Add new Task")),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            myFunc();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.redAccent,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
        title: Text(
          "TO DO TASKS",
          style: TextStyle(
              color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                deleteAllTasks();
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 37,
              ))
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            counter(
              completed: calculateCompletedTasks(),
              length: allTasks.length,
            ),
            Container(
              margin: EdgeInsets.only(top: 22),
              height: 500,
              color: Color.fromARGB(255, 55, 63, 82),
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return mylist(
                      vartitle: allTasks[index].title,
                      theStatus: allTasks[index].status,
                      changeStatus: changeStatus,
                      index: index,
                      deleteStatus: deleteTasks,
                      editTask: editTasks,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
