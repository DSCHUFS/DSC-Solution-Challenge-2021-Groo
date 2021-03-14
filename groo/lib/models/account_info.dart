import 'package:flutter/foundation.dart';

class AccountInfo {
  AccountInfo({
    @required this.id,
    this.showEmail,
    this.showBadges,
    this.showCampaigns,
    this.followers,
    this.followings,
  });

  final String id;
  final bool showEmail;
  final bool showBadges;
  final bool showCampaigns;
  final List<dynamic> followers;
  final List<dynamic> followings;

  factory AccountInfo.fromMap(Map<dynamic, dynamic> data, String id) {
    return AccountInfo(
      id: id,
      showEmail: data['showEmail'],
      showBadges: data['showBadges'],
      showCampaigns: data['showCampaigns'],
      followers: data['followers'],
      followings: data['followings'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'showEmail': showEmail,
      'showBadges': showBadges,
      'showCampaigns': showCampaigns,
      'followers': followers,
      'followings': followings,
    };
  }
}
