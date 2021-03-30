# Groo (DSC-Solution-Challenge-2021)

![Flutter](https://img.shields.io/badge/Dart-Flutter-blue?logo=Flutter)
![Firebase](https://img.shields.io/badge/with-Firebase-FFCC00?logo=Firebase)

🌳 Groo(그루) - Growing up slowly and strong like the characteristics of a "Tree".

![image](https://user-images.githubusercontent.com/56063805/113023088-41e1d680-91c0-11eb-93ca-81b05fa156a4.png)

> A Service App that provides challenges and counseling services to relieve depression caused by Corona Blue.

> 코로나 블루 극복을 위한 챌린지 참여 및 우울증 완화를 위한 상담 매칭 어플

## Explanation

This project is made by DSC HUFS(Hankuk University of Foreign Studies) for DSC Solution Challenge 2021.

By using Flutter App and Firebase, You can cultivate a more energetic life through a challenge that anyone can participate in. Furthermore, through the depression counseling function, the burden of access to psychiatric counseling is reduced and the video counseling function is provided for the disabled.

For more information check our Youtube introducing our Solution.

//TODO
[DSC HUFS Youtube](https://youtu.be/sV1MkwgMrNU)

# Getting Started

## Installation

1. [How to install Flutter](https://flutter.dev/docs/get-started/install)

2. [Set up an editor](https://flutter.dev/docs/get-started/editor?tab=vscode)

3. App Clone:

```bash
git clone https://github.com/DSCHUFS/DSC-Solution-Challenge-2021-Groo.git
```

## Build and Run

1. [Providing SHA1/SHA256 key](https://developers.google.com/android/guides/client-auth)

2. After creating SHA-1 / 256 key using JAVA keytool, add it to "SHA certificate fingerprint" in "My App" of firebase.

3. Launch `Terminal` and move to Project Directory.

4. Enter `flutter pub get`.

```bash
flutter pub get
```

5. Enter `flutter run`.

```bash
flutter run
```

6. You can use the demo account
> _This account will be deleted after the contest._
```
ID : dschufs3@gmail.com
PW : solution2021!
```

# Technical Stacks

## Firebase - Firestore

- We used Firestore because the app needs to store users' personal informations and build a community

- #### Usage
  > Create & Update
  ```dart
  //Create, Update
  Future<void> setData({
      @required String path,
      @required Map<String, dynamic> data,
  }) async {
      final reference = FirebaseFirestore.instance.doc(path);
      print('$path: $data');
      await reference.set(data);
  }
  ```
  > Read Collection Stream
  ```dart
  //Read Collection
  Stream<List<T>> collectionStream<T>({
      @required String path,
      @required T Function(Map<String, dynamic> data, String documentId) builder,
      Query Function(Query query) queryBuilder,
      int Function(T lhs, T rhs) sort,
  }) {
      Query query = FirebaseFirestore.instance.collection(path);
      if (queryBuilder != null) {
      query = queryBuilder(query);
      }
      final snapshots = query.snapshots();
      return snapshots.map((snapshot) {
          final result = snapshot.docs
              .map((snapshot) => builder(snapshot.data(), snapshot.id))
              .where((value) => value != null)
              .toList();
          if (sort != null) {
              result.sort(sort);
          }
          return result;
      });
  }
  ```
  > Read Document Stream
  ```dart
  //Read Document
  Stream<T> documentStream<T>({
      @required String path,
      @required T builder(Map<String, dynamic> data, String documentID),
  }) {
      final reference = FirebaseFirestore.instance.doc(path);
      final snapshots = reference.snapshots();
      return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }
  ```
  > Delete
  ```dart
  //Delete
  Future<void> deleteData({@required String path}) async {
     final reference = FirebaseFirestore.instance.doc(path);
     print('delete: $path');
     await reference.delete();
  }
  ```

## Firebase - Storage

- We used Firebase Storage to store badge and challenge images

- #### Usage
  ```dart
  // using firebase_image package
  List<Padding> items = snapshot.data
                  .map(
                    (e) => Padding(
                      padding: badgePadding,
                      child: Image(
                        image: FirebaseImage(
                          e.imagePath,
                          maxSizeBytes: 4000 * 1000,
                        ),
                      ),
                    ),
                  )
                  .toList();
  ```

## Firebase - Authentication

- The app provides 3 way social logins - Google, Facebook, Twitter. 

- #### Usage
    > Sign in with Google
    ```dart
    Future<User> signInWithGoogle() async {
        final googleSignIn = GoogleSignIn();
        final googleUser = await googleSignIn.signIn();
        if (googleUser != null) {
            final googleAuth = await googleUser.authentication;
            if (googleAuth.idToken != null) {
                final userCredential = await _firebaseAuth
                    .signInWithCredential(GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken,
                ));
                return userCredential.user;
            } else {
                throw FirebaseAuthException(
                code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
                message: 'Missing Google ID Token',
                );
            }
        } else {
            throw FirebaseAuthException(
                code: 'ERROR_ABORTED_BY_USER',
                message: 'Sign in aborted by user',
            );
        }
    }
    ```

    > Sign in with Facebook
    ```dart
    Future<User> signInWithFacebook() async {
        final fb = FacebookLogin();
        final response = await fb.logIn(permissions: [
            FacebookPermission.publicProfile,
            FacebookPermission.email,
        ]);
        switch (response.status) {
            case FacebookLoginStatus.success:
                final accessToken = response.accessToken;
                final userCredential = await _firebaseAuth.signInWithCredential(
                FacebookAuthProvider.credential(accessToken.token),
                );
                return userCredential.user;
            case FacebookLoginStatus.cancel:
                throw FirebaseAuthException(
                    code: 'ERROR_ABORTED_BY_USER',
                    message: 'Sign in aborted by user',
                );
            case FacebookLoginStatus.error:
                throw FirebaseAuthException(
                    code: 'ERROR_ABORTED_LOGIN_FAILED',
                    message: response.error.developerMessage,
                );
            default:
                throw UnimplementedError();
        }
    }
    ```

    > Sign in with Twitter
    ```dart
    Future<User> signInWithTwitter() async {
        final twitterLogin = TwitterLogin(
            // Consumer API keys
            apiKey: '<<Twitter OAuth apiKey>>',
            // Consumer API Secret keys
            apiSecretKey: '<<Twitter OAuth apiSecretKey>>',
            // Registered Callback URLs in TwitterApp
            // Android is a deeplink
            // iOS is a URLScheme
            redirectURI: '<<Twitter OAuth redirectURI>>',
        );
        final authResult = await twitterLogin.login();
        switch (authResult.status) {
            case TwitterLoginStatus.loggedIn:
                final accessToken = authResult.authToken;
                final accessTokenSecret = authResult.authTokenSecret;
                final userCredential = await _firebaseAuth.signInWithCredential(
                    TwitterAuthProvider.credential(
                        accessToken: accessToken, secret: accessTokenSecret),
                );
                return userCredential.user;
            case TwitterLoginStatus.cancelledByUser:
                throw FirebaseAuthException(
                    code: 'ERROR_ABORTED_BY_USER',
                    message: 'Sign in aborted by user',
                );
            case TwitterLoginStatus.error:
                throw FirebaseAuthException(
                    code: 'ERROR_ABORTED_LOGIN_FAILED',
                    message: authResult.errorMessage,
                );
            default:
                throw UnimplementedError();
        }
    }
    ```

## Flutter - Provider package

- We used Provider package to manage app state for user information and datas.

- #### Usage
    > Auth State
    ```dart
    class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Provider<AuthBase>(
                create: (context) => Auth(),
                child: MaterialApp(
                ...
                ),
            );
        }
    }
    ```

    > Database State
    ```dart
    Widget build(BuildContext context) {
        final auth = Provider.of<AuthBase>(context, listen: false);
        return StreamBuilder<User>(
            stream: auth.authStateChanges(),
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                    final User user = snapshot.data;
                    if (user == null) {
                        return SignInScreen();
                    }
                    return Provider<Database>(
                        create: (_) => databaseBuilder(user.uid),
                        child: MainScreen(),
                    );
                }
                return Scaffold(
                    body: Center(
                        child: CircularProgressIndicator(),
                    ),
                );
            },
        );
    }
    ```

## Flutter - Local Push Notification

- We used app Local Push Notification so that user can check the challenge every day.

- #### Usage

    ```dart
    Future<void> setNotification(int hour, int minute) async {
        final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
        final result = await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
            );
        var androidDetails = new AndroidNotificationDetails(
            "channelId",
            "channelName",
            "channelDescription",
            importance: Importance.max,
            priority: Priority.max,
        );
        var iosDetails = new IOSNotificationDetails();
        var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iosDetails);

        if (result) {
            await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
            ?.deleteNotificationChannelGroup('id');

            await flutterLocalNotificationsPlugin.zonedSchedule(
                0,
                "Check your Challenge Progress!",
                "Did you do your challenge today? Go to check and grow your plant!",
                _setNotiTime(hour, minute),
                generalNotificationDetails,
                androidAllowWhileIdle: true,
                uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
                matchDateTimeComponents: DateTimeComponents.time,
            );
        }
    }
    ```

## Flutter - shared_preferences plugin

- The app can save setting datas on the device by using shared_preferences plugin

- #### Usage

    ```dart
    _loadPref() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
            _isNotify = (prefs.getBool('isNotify') ?? false);
        });
    }

    _setPref(bool value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
            _isNotify = value;
            prefs.setBool('isNotify', _isNotify);
        });
    }
    ```

# DB

# Screenshots
<img src="https://user-images.githubusercontent.com/56063805/113026205-c97d1480-91c3-11eb-9fa5-e204af31c01e.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113026233-cf72f580-91c3-11eb-8a68-cf4125fbf1cd.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113026241-d26de600-91c3-11eb-8a5a-4fb089876baf.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/113027625-465cbe00-91c5-11eb-8e5e-fca524f6bc2d.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113026305-e285c580-91c3-11eb-94d1-a7eaf466b4f2.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113026269-d8fc5d80-91c3-11eb-8c50-a174e906b00c.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/113027169-bfa7e100-91c4-11eb-84c1-de171d7958a4.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113027197-c8001c00-91c4-11eb-8251-3e3b231cb251.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113027153-bb7bc380-91c4-11eb-9344-e91eacb0e832.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/113027159-bdde1d80-91c4-11eb-9436-9f0e7575ab4c.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113026256-d6016d00-91c3-11eb-98ff-b21a92a246ba.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113027192-c59dc200-91c4-11eb-9242-fb91893cf4c3.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/113027177-c20a3b00-91c4-11eb-895b-9806261ee171.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113027146-b9196980-91c4-11eb-9c44-f87d3f7ee33e.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113026353-f16c7800-91c3-11eb-9517-b48977f7f695.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/113026344-ef0a1e00-91c3-11eb-8f9b-10eca08b145c.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113026333-eca7c400-91c3-11eb-92d7-7a777af22d73.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/113026324-e7e31000-91c3-11eb-866b-ebeb49c667aa.png" width="30%">







# Contributors

- [Chaewon Lee](https://github.com/lcw729)
- [Donghyun Ahn](https://github.com/devdonghyun)
- [Wonhyuk Choi](https://github.com/devluce)
- [Yoongyo Lee](https://github.com/lykee2000)

# License

[MIT](https://choosealicense.com/licenses/mit/)
