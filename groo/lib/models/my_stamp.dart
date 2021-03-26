import 'package:flutter/material.dart';

class MyStamp {
  MyStamp({@required this.id, @required this.attendance});

  final String id;
  final List<bool> attendance;

  factory MyStamp.fromMap(Map<dynamic, dynamic> data, String id) {
    return MyStamp(
      id: id,
      attendance: data['attendance'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendance': attendance,
    };
  }
}
