// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html';

import 'package:keycloak_flutter/keycloak_flutter.dart';

Future<bool> loginkeycloak() async {
  try {
    late KeycloakService keycloakService;
    keycloakService = KeycloakService(KeycloakConfig(
        url: 'https://rhsso-dev.grupomateus.com.br/auth',
        realm: 'grupomateus',
        clientId: 'gmsuite'));
    await keycloakService.init(
      initOptions: KeycloakInitOptions(
        onLoad: 'check-sso',
        responseMode: 'query',
        //redirectUri: '${window.location.pathname}'
        silentCheckSsoRedirectUri:
            '${window.location.origin}/silent-check-sso.html',
      ),
    );

    final isAuthenticated = await keycloakService.isLoggedIn();
    if (isAuthenticated) {
      return true; // O usuário está logado
    } else {
      // Realize o login
      await keycloakService.login(KeycloakLoginOptions(
        redirectUri: '${window.location.origin}',
      ));
      // Tente novamente após o login
      return await keycloakService.isLoggedIn();
    }
  } catch (e) {
    // Lide com exceções aqui
    print('Erro: $e');
    return false; // Em caso de erro, retorne false
  }
}
