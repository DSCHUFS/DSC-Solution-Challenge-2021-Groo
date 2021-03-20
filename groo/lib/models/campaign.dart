import 'package:flutter/material.dart';

class Campaign {
  Campaign({
    @required this.id,
    this.name,
    this.imagePath,
    this.description,
  });

  final String id;
  final String name;
  final String imagePath;
  final String description;

  factory Campaign.fromMap(Map<String, dynamic> data, String id) {
    return Campaign(
      id: id,
      name: data['name'],
      imagePath: data['imagePath'],
      description: data['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imagePath': imagePath,
      'description': description,
    };
  }
}
