import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groo/models/account_info.dart';
import 'package:groo/screens/profile_view_screen.dart';

class FollowListScreen extends StatelessWidget {
  const FollowListScreen({Key key, this.database}) : super(key: key);
  final database;

  Future<Map<String, dynamic>> _getUserInfo(String uid) async {
    final snapShot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return snapShot.data();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF616e70),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: StreamBuilder<AccountInfo>(
          stream: database.accountStream(),
          builder: (context, snapshot) {
            final accountInfo = snapshot.data;
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: accountInfo.followers.length,
                  itemBuilder: (context, index) {
                    final user = _getUserInfo(accountInfo.followers[index]);
                    return StreamBuilder<Map<String, dynamic>>(
                        stream: user.asStream(),
                        builder: (context, userSnapshot) {
                          if (!userSnapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(userSnapshot.data["imagePath"]),
                            ),
                            title: Text(userSnapshot.data["name"]),
                            // subtitle: Text(),
                            onTap: () {
                              ProfileViewScreen.show(
                                context,
                                database: database,
                                stream: user.asStream(),
                                uid: accountInfo.followers[index],
                              );
                            },
                          );
                        });
                  }),
            );
          },
        ),
      ),
    );
  }
}
