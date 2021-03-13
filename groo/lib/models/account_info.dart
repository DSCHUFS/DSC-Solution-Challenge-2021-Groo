import 'package:flutter/foundation.dart';

class AccountInfo {
  AccountInfo(
      {@required this.id, this.showEmail, this.followers, this.followings});

  final String id;
  final bool showEmail;
  final List<dynamic> followers;
  final List<dynamic> followings;

  factory AccountInfo.fromMap(Map<dynamic, dynamic> data, String id) {
    return AccountInfo(
      id: id,
      showEmail: data['showEmail'],
      followers: data['followers'],
      followings: data['followings'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'showEmail': showEmail,
      'followers': followers,
      'followings': followings,
    };
  }
}
