import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SrConstruccionVendedoresFirebaseUser {
  SrConstruccionVendedoresFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SrConstruccionVendedoresFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SrConstruccionVendedoresFirebaseUser>
    srConstruccionVendedoresFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SrConstruccionVendedoresFirebaseUser>(
            (user) => currentUser = SrConstruccionVendedoresFirebaseUser(user));
