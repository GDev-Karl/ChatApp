import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void handleAuthError(dynamic error) {
  String errorMessage = 'Une erreur s\'est produite. Veuillez réessayer.';

  if (error is FirebaseAuthException) {
    switch (error.code) {
      case 'invalid-email':
        errorMessage = 'Adresse e-mail invalide.';
        break;
      case 'user-not-found':
        errorMessage = 'Utilisateur non trouvé.';
        break;
      case 'wrong-password':
        errorMessage = 'Mot de passe incorrect.';
        break;
      // Ajoutez d'autres codes d'erreur selon vos besoins
    }
  }

  // Afficher l'erreur à l'utilisateur
  var context;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Erreur'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
