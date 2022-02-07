import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MChokeP1eFirebaseUser {
  MChokeP1eFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

MChokeP1eFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MChokeP1eFirebaseUser> mChokeP1eFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MChokeP1eFirebaseUser>(
        (user) => currentUser = MChokeP1eFirebaseUser(user));
