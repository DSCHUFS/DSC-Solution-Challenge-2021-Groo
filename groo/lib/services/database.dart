import 'package:flutter/material.dart';
import 'package:groo/models/account_info.dart';
import 'package:groo/models/challenge.dart';
import 'package:groo/models/my_badge.dart';
import 'package:groo/models/my_challenge.dart';
import 'package:groo/models/participant.dart';
import 'package:groo/services/api_path.dart';
import 'package:groo/services/firestore_service.dart';

abstract class Database {
  Stream<AccountInfo> accountStream();
  Future<void> setAccountInfo(AccountInfo accountInfo);

  Future<void> setMyBadge(MyBadge myBadge);
  Future<void> deleteMyBadge(MyBadge myBadge);
  Stream<List<MyBadge>> myBadgesStream(String uid);

  Future<void> setMyChallenge(MyChallenge myChallenge);
  Future<void> deleteMyChallenge(MyChallenge myChallenge);
  Stream<List<MyChallenge>> myChallengesStream(String uid);

  Stream<Challenge> thisChallengeStream();
  Future<void> setThisChallenge(Challenge challenge);

  Stream<Challenge> nextChallengeStream();
  Future<void> setNextChallenge(Challenge challenge);

  Future<void> setParticipant(Participant participant);
  Future<void> deleteParticipant(Participant participant);
  Stream<List<Participant>> participantsStream();
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
  Future<void> setMyBadge(MyBadge myBadge) => _service.setData(
        path: APIPath.myBadge(uid, myBadge.id),
        data: myBadge.toMap(),
      );
  @override
  Future<void> deleteMyBadge(MyBadge myBadge) => _service.deleteData(
        path: APIPath.myBadge(uid, myBadge.id),
      );
  @override
  Stream<List<MyBadge>> myBadgesStream(String uid) => _service.collectionStream(
        path: APIPath.myBadges(uid),
        builder: (data, documentId) => MyBadge.fromMap(data, documentId),
      );

  @override
  Future<void> setMyChallenge(MyChallenge myChallenge) => _service.setData(
        path: APIPath.myChallenge(uid, myChallenge.id),
        data: myChallenge.toMap(),
      );
  @override
  Future<void> deleteMyChallenge(MyChallenge myChallenge) =>
      _service.deleteData(
        path: APIPath.myChallenge(uid, myChallenge.id),
      );
  @override
  Stream<List<MyChallenge>> myChallengesStream(String uid) =>
      _service.collectionStream(
        path: APIPath.myChallenges(uid),
        builder: (data, documentId) => MyChallenge.fromMap(data, documentId),
      );

  @override
  Stream<Challenge> thisChallengeStream() => _service.documentStream(
        path: APIPath.thisMonthChallenge(),
        builder: (data, documentId) => Challenge.fromMap(data, documentId),
      );
  @override
  Future<void> setThisChallenge(Challenge challenge) => _service.setData(
        path: APIPath.thisMonthChallenge(),
        data: challenge.toMap(),
      );

  @override
  Stream<Challenge> nextChallengeStream() => _service.documentStream(
        path: APIPath.nextMonthChallenge(),
        builder: (data, documentId) => Challenge.fromMap(data, documentId),
      );
  @override
  Future<void> setNextChallenge(Challenge challenge) => _service.setData(
        path: APIPath.nextMonthChallenge(),
        data: challenge.toMap(),
      );

  @override
  Future<void> setParticipant(Participant participant) => _service.setData(
        path: APIPath.challengeParticipant(participant.id),
        data: participant.toMap(),
      );
  @override
  Future<void> deleteParticipant(Participant participant) =>
      _service.deleteData(
        path: APIPath.challengeParticipant(participant.id),
      );
  @override
  Stream<List<Participant>> participantsStream() => _service.collectionStream(
        path: APIPath.challengeParticipants(),
        builder: (data, documentId) => Participant.fromMap(data, documentId),
      );
}
