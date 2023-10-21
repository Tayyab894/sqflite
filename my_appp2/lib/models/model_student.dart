import 'package:flutter/material.dart';

class ModelStudent {
  int id;
  String name;
  // String user_id;
  // String email;
  // String phone;
  // String fcm;

  ModelStudent({required this.id, required this.name});

  Map<String, dynamic> toMap() => {"id": id, "name": name};

  factory ModelStudent.ModelObjectfromMap(Map<String, dynamic> map_value) =>
      ModelStudent(id: map_value["id"], name: map_value["name"]);
}




// class ModalUser {
//   ModelStudent mmm = ModelStudent(id: 5, name: 'tayyab');

//   int? id;
//   String? name;
//   String? user_id;
//   String? email;
//   String? phone;
//   String? fcm;
//   ModalUser({
//     required this.id,
//     required this.name,
//     required this.user_id,
//     required this.email,
//     required this.phone,
//     required this.fcm,
//   });
//   factory ModalUser.fromMap(Map<String, dynamic> json) => ModalUser(
//         id: json['id'],
//         name: json['name'],
//         user_id: json['user_id'],
//         email: json['email'],
//         phone: json['phone'],
//         fcm: json['fcm'],
//       );

//   Map<String, dynamic> toMap() => {
//         "user_id": user_id,
//         "name": name,
//         "email": email,
//         "phone": email,
//         "fcm": fcm,
//       };
// }

// // #flutter-Classes