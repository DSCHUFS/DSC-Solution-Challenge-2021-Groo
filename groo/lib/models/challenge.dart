import 'package:flutter/material.dart';

class Challenge {
  Challenge({
    @required this.id,
    this.name,
    this.totalDays, // challenge Performance period
    this.time, // challenge Execution time
    this.imagePath,
    this.description,
  });

  final String id;
  final String name;
  final int totalDays;
  final int time;
  final String imagePath;
  final String description;

  factory Challenge.fromMap(Map<String, dynamic> data, String id) {
    return Challenge(
      id: id,
      name: data['name'],
      totalDays: data['totalDays'],
      time: data['time'],
      imagePath: data['imagePath'],
      description: data['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'totalDays': totalDays,
      'time': time,
      'imagePath': imagePath,
      'description': description,
    };
  }
}
