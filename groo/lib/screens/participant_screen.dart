import 'package:flutter/material.dart';
import 'package:groo/models/participant.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:provider/provider.dart';
import 'const.dart';

class ParticipantScreen extends StatelessWidget {
  const ParticipantScreen({Key key, @required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context, {Database database}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ParticipantScreen(
          database: database,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = auth.currentUser;
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        leading: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Color(0xFF2EB402)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'participant',
          style: titleTextStyle,
        ),
        backgroundColor: Color(0xFF2EB402),
      ),
      body: StreamBuilder<List<Participant>>(
        stream: database.participantsStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => UserContainer(
              path: snapshot.data[index].imagePath,
              userName: snapshot.data[index].name,
            ),
          );
        },
      ),

      // SingleChildScrollView(
      //   child: Column(children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [UserContainer(), UserContainer(), UserContainer()],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [UserContainer(), UserContainer(), UserContainer()],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [UserContainer(), UserContainer(), UserContainer()],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [UserContainer(), UserContainer(), UserContainer()],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [UserContainer(), UserContainer(), UserContainer()],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [UserContainer(), UserContainer(), UserContainer()],
      //     ),
      //   ]),
      // ),
    );
  }
}

class UserContainer extends StatelessWidget {
  const UserContainer({this.userName, this.path});
  final String userName;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(path),
              radius: MediaQuery.of(context).size.width * 0.12,
            ),
            SizedBox(height: 5),
            Text(
              userName,
              style: TextStyle(
                  fontFamily: 'Inconsolata',
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
