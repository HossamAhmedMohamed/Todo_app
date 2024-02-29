// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class mylist extends StatelessWidget {
  final String vartitle;
  final bool theStatus;
  final Function changeStatus;
  final Function deleteStatus;
  final int index;
  final Function editTask;
  final myController = TextEditingController();
  mylist({
    super.key,
    required this.vartitle,
    required this.theStatus,
    required this.changeStatus,
    required this.index,
    required this.deleteStatus,
    required this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Color.fromRGBO(209, 224, 224, 0.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: theStatus
                    ? TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        decoration: TextDecoration.lineThrough)
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
              ),
              Row(
                children: [
                  Icon(
                    theStatus ? Icons.check : Icons.close,
                    color: theStatus ? Colors.green[400] : Colors.red,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
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
                                      maxLength: 20,
                                      decoration: InputDecoration(
                                          hintText: "edit task"),
                                      controller: myController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          editTask(index, myController.text);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "SAVE",
                                          style: TextStyle(fontSize: 22),
                                        ))
                                  ],
                                ),
                              
                            );
                          },
                          isScrollControlled: true);
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      deleteStatus(index);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 27,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
