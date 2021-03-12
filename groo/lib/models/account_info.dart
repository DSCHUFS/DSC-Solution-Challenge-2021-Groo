import 'package:flutter/foundation.dart';

class AccountInfo {
  AccountInfo({@required this.id, @required this.showEmail});

  final String id;
  final bool showEmail;

  factory AccountInfo.fromMap(Map<dynamic, dynamic> data, String id) {
    return AccountInfo(
      id: id,
      showEmail: data['showEmail'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'showEmail': showEmail,
    };
  }
}
