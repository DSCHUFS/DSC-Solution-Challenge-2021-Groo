import 'package:flutter/material.dart';

abstract class Database {}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  final String uid;
}
