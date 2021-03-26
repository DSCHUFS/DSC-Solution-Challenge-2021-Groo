import 'package:flutter/material.dart';

class MyStamp{
  MyStamp({
    @required this.attendance
  });

  final List<bool> attendance;

  factory MyStamp.fromMap(Map<dynamic, dynamic> data, String id) {
    return MyStamp(
      attendance: data['attendance'],
    );
  }

  
}