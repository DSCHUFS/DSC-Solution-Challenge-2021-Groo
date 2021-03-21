import 'package:flutter/foundation.dart';

class Participant {
  Participant({
    @required this.id,
    this.name,
    this.imagePath,
  });

  final String id;
  final String name;
  final String imagePath;

  factory Participant.fromMap(Map<dynamic, dynamic> data, String id) {
    return Participant(
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
