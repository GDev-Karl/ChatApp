import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'error_handling.dart';
import 'login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> resetPassword(String email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
    // Un e-mail de réinitialisation du mot de passe a été envoyé avec succès
  } catch (e) {
    handleAuthError(e);
  }
}

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réinitialiser le mot de passe'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Adresse e-mail',
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  resetPassword(email);
                },
                child: Text('Réinitialiser le mot de passe'),
              ),
              SizedBox(height: 12.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Retour à la page de connexion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
