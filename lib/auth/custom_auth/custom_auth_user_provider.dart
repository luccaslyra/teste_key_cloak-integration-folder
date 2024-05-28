import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class TesteKeyCloakAuthUser {
  TesteKeyCloakAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<TesteKeyCloakAuthUser> testeKeyCloakAuthUserSubject =
    BehaviorSubject.seeded(TesteKeyCloakAuthUser(loggedIn: false));
Stream<TesteKeyCloakAuthUser> testeKeyCloakAuthUserStream() =>
    testeKeyCloakAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
