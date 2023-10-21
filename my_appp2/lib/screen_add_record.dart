import 'package:flutter/material.dart';
import 'package:my_appp2/models/database_student.dart';
import 'package:my_appp2/models/model_student.dart';

class ScreenAddRecord extends StatefulWidget {
  const ScreenAddRecord({Key? key}) : super(key: key);

  @override
  State<ScreenAddRecord> createState() => _ScreenAddRecordState();
}

class _ScreenAddRecordState extends State<ScreenAddRecord> {
  String id = "";
  String name = "";
  DatabaseStudent databaseStudent = DatabaseStudent();

  @override
  void initState() {
    super.initState();

    setState(() {
      databaseStudent.initializeDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Record"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(onChanged: (String value) {
              setState(() {
                id = value;
                print("$id");
              });
            }),
            SizedBox(
              height: 20,
            ),
            TextField(onChanged: (String value) {
              setState(() {
                name = value;
                print("$name");
              });
            }),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      if (id.isNotEmpty) {
                        if (name.isNotEmpty) {
                          ModelStudent modelStudent =
                              ModelStudent(id: int.parse(id), name: name);
                          databaseStudent.UpdateStudent(modelStudent)
                              .then((bool isAdded) {
                            if (isAdded) {
                              print("Record Updated Sucessfully");
                            } else {
                              print("Record updation Failed");
                            }
                          });
                        } else {
                          print("Please Provide name");
                        }
                      } else {
                        print("Please Provide id");
                      }
                    },
                    child: Text("Update Record")),
                TextButton(
                    onPressed: () async {
                      if (id.isNotEmpty) {
                        if (name.isNotEmpty) {
                          ModelStudent modelStudent =
                              ModelStudent(id: int.parse(id), name: name);

                          // bool isAdded = await databaseStudent.AddStudent(modelStudent);

                          databaseStudent.AddStudent(modelStudent)
                              .then((bool isAdded) {
                            if (isAdded) {
                              print("Record Add Sucessfully");
                            } else {
                              print("Record insertion Failed");
                            }
                          });
                        } else {
                          print("Please Provide name");
                        }
                      } else {
                        print("Please Provide id");
                      }
                    },
                    child: Text("Add Record")),
              ],
            ),

            // 2ND ROW
            SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      if (id.isNotEmpty) {
                        databaseStudent.DeleteStudentById(id)
                            .then((bool isAdded) {
                          if (isAdded) {
                            print("Record Deleted Sucessfully");
                          } else {
                            print("Record Deletion Failed");
                          }
                        });
                      } else {
                        print("Please Provide id");
                      }
                    },
                    child: Text("Delete Single Record")),
                TextButton(
                    onPressed: () async {
                      databaseStudent.DeleteAllStudent().then((bool isAdded) {
                        if (isAdded) {
                          print("Record Deleted Sucessfully");
                        } else {
                          print("Record Deletion Failed");
                        }
                      });
                    },
                    child: Text("Delete All Records")),
              ],
            ),

            // ROW 3

            SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      if (id.isNotEmpty) {
                        databaseStudent.GetCountStudent().then((value) {
                          print("Total Records = $value");
                        });
                      } else {
                        print("Please Provide id");
                      }
                    },
                    child: Text("Count Record")),
                TextButton(
                    onPressed: () async {
                      databaseStudent.GetAllStudent()
                          .then((List<ModelStudent> list) {
                        list.forEach((element) {
                          print("Id: ${element.id}, Name: ${element.name}");
                        });
                      });
                    },
                    child: Text("Display Records")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
