import 'package:flutter/foundation.dart';

class MyCampaign {
  MyCampaign({
    @required this.id,
    @required this.campaignId,
    @required this.name,
    @required this.isSuccess,
    @required this.imagePath,
  });

  final String id;
  final String campaignId;
  final String name;
  final bool isSuccess;
  final String imagePath;

  factory MyCampaign.fromMap(Map<dynamic, dynamic> data, String id) {
    return MyCampaign(
      id: id,
      campaignId: data['campaignId'],
      name: data['name'],
      isSuccess: data['isSuccess'],
      imagePath: data['imagePath'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'campaignId': campaignId,
      'name': name,
      'isSuccess': isSuccess,
      'imagePath': imagePath,
    };
  }
}
