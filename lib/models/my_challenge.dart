import 'package:flutter/foundation.dart';

class MyChallenge {
  MyChallenge({
    @required this.id,
    @required this.name,
    @required this.challengeDays,
    @required this.imagePath,
  });

  final String id;
  final String name;
  final int challengeDays;
  final String imagePath;

  factory MyChallenge.fromMap(Map<dynamic, dynamic> data, String id) {
    return MyChallenge(
      id: id,
      name: data['name'],
      challengeDays: data['challengeDays'],
      imagePath: data['imagePath'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'isSuccess': challengeDays,
      'imagePath': imagePath,
    };
  }
}
