import 'package:cloud_firestore/cloud_firestore.dart';

class AccountInfo {
  AccountInfo({
    this.id,
    this.name,
    this.email,
    this.imagePath,
    this.showEmail,
    this.showBadges,
    this.showCampaigns,
    this.followers,
    this.followings,
    this.attendDays,
    this.lastAttendance,
  });

  final String id;
  final String name;
  final String email;
  final String imagePath;
  final bool showEmail;
  final bool showBadges;
  final bool showCampaigns;
  final List<dynamic> followers;
  final List<dynamic> followings;
  final int attendDays;
  final Timestamp lastAttendance;

  factory AccountInfo.fromMap(Map<dynamic, dynamic> data, String id) {
    return AccountInfo(
      id: id,
      name: data['name'],
      email: data['email'],
      imagePath: data['imagePath'],
      showEmail: data['showEmail'],
      showBadges: data['showBadges'],
      showCampaigns: data['showCampaigns'],
      followers: data['followers'],
      followings: data['followings'],
      attendDays: data['attendDays'],
      lastAttendance: data['lastAttendance'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'imagePath': imagePath,
      'showEmail': showEmail,
      'showBadges': showBadges,
      'showCampaigns': showCampaigns,
      'followers': followers,
      'followings': followings,
      'attendDays': attendDays,
      'lastAttendance': lastAttendance,
    };
  }
}
