import 'package:cloud_firestore/cloud_firestore.dart';

class CounselingInfo {
  final String name;
  final String profile;
  final String meetLink;
  final List doctorInfo;
  final bool like;
  final bool list;
  final DocumentReference reference;

  CounselingInfo.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        profile = map['profile'],
        like = map['like'],
        list = map['list'],
        meetLink = map['meetLink'],
        doctorInfo = map['doctorInfo'];

  CounselingInfo.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
