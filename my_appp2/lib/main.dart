import 'package:flutter/material.dart';
import 'package:my_appp2/models/model_student.dart';
import 'package:my_appp2/screen_add_record.dart';

void main() {
  runApp(const MyApp(),);
  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? title;

  @override
  void initState() {
    super.initState();

    // ModelStudent ssss = ModelStudent(id: 2, name: 'tayyab');

    // ModelStudent second_obj = ModelStudent.ModelObjectfromMap(ssss.toMap());

    // Map<String, dynamic> ffff = {"ssss": 1};

    // print(ffff["ssss"]);
  }

  @override
  Widget build(BuildContext context) {
     return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQFLITE PRACTICE',
      home: ScreenAddRecord(),
    );
  }
}
