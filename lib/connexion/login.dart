import 'package:flutter/material.dart';
import 'reset_password.dart';
import 'signin.dart';
import 'accueil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible =
      false; // Ajout de la variable pour gérer la visibilité du mot de passe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Adresse e-mail',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une adresse e-mail.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  controller: passwordController,
                  obscureText:
                      !_isPasswordVisible, // Utilisation de la variable pour définir l'état de visibilité du mot de passe
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer un mot de passe.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String email = emailController.text;
                      String password = passwordController.text;

                      // TODO: Authentification avec le back-end
                      // Utilisez la méthode appropriée pour la connexion

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AccueilPage()),
                      );
                    }
                  },
                  child: Text('Se connecter'),
                ),
                SizedBox(height: 12.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    );
                  },
                  child: Text('Créer un compte'),
                ),
                SizedBox(height: 12.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordPage()),
                    );
                  },
                  child: Text('Mot de passe oublié'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
