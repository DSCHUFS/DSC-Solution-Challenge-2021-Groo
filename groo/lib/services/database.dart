import 'package:flutter/material.dart';
import 'package:groo/models/account_info.dart';
import 'package:groo/models/my_campaign.dart';
import 'package:groo/services/api_path.dart';
import 'package:groo/services/firestore_service.dart';

abstract class Database {
  Stream<AccountInfo> accountStream();
  Future<void> setAccountInfo(AccountInfo accountInfo);

  Future<void> setMyCampaign(MyCampaign myCampaign);
  Future<void> deleteMyCampaign(MyCampaign myCampaign);
  Stream<List<MyCampaign>> myCampaignsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Stream<AccountInfo> accountStream() => _service.documentStream(
        path: APIPath.accountInfo(uid),
        builder: (data, documentId) => AccountInfo.fromMap(data, documentId),
      );

  @override
  Future<void> setAccountInfo(AccountInfo accountInfo) => _service.setData(
        path: APIPath.accountInfo(uid),
        data: accountInfo.toMap(),
      );

  @override
  Future<void> setMyCampaign(MyCampaign myCampaign) => _service.setData(
        path: APIPath.myCampaign(uid, myCampaign.id),
        data: myCampaign.toMap(),
      );

  @override
  Future<void> deleteMyCampaign(MyCampaign myCampaign) => _service.deleteData(
        path: APIPath.myCampaign(uid, myCampaign.id),
      );

  @override
  Stream<List<MyCampaign>> myCampaignsStream() => _service.collectionStream(
        path: APIPath.myCampaigns(uid),
        builder: (data, documentId) => MyCampaign.fromMap(data, documentId),
      );
}
