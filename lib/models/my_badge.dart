import 'package:flutter/foundation.dart';

class MyBadge {
  MyBadge({
    @required this.id,
    @required this.name,
    @required this.imagePath,
  });

  final String id;
  final String name;
  final String imagePath;

  factory MyBadge.fromMap(Map<dynamic, dynamic> data, String id) {
    return MyBadge(
      id: id,
      name: data['name'],
      imagePath: data['imagePath'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imagePath': imagePath,
    };
  }
}
