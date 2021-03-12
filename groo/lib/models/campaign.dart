import 'package:flutter/material.dart';

class Campaign {
  Campaign({
    @required this.id,
    @required this.name,
    @required this.description,
  });

  final String id;
  final String name;
  final String description;

  factory Campaign.fromMap(Map<String, dynamic> data, String id) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final String description = data['description'];
    return Campaign(
      id: id,
      name: name,
      description: description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }
}
