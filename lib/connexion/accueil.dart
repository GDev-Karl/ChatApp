import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  int _currentIndex = 0;
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: (_currentIndex == 0)
          ? ContactsPage(searchQuery: searchQuery)
          : (_currentIndex == 1)
              ? GroupesPage()
              : ChatbotPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groupes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chatbot',
          ),
        ],
      ),
    );
  }
}

class ContactsPage extends StatelessWidget {
  late final String searchQuery;

  ContactsPage({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    var searchController;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Action à effectuer lors de l'appui sur l'icône de recherche
                  // Vous pouvez déclencher la recherche ici
                },
              ),
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    searchQuery = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Rechercher des contacts',
                  ),
                ),
              ),
            ],
          ),
          // Ajoutez ici la liste des contacts ou les résultats de recherche
          // Utilisez la valeur de searchQuery pour filtrer les contacts
        ],
      ),
    );
  }
}

class GroupesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page des groupes'),
    );
  }
}

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController messageController = TextEditingController();
  final List<String> messages = [];

  void _sendMessage() {
    setState(() {
      String message = messageController.text;
      messages.add(message);
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    labelText: 'Message',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.insert_emoticon),
                onPressed: () {
                  // Action à effectuer lors de l'appui sur l'icône d'emoji
                  // Vous pouvez ajouter la logique pour insérer un emoji dans le champ de texte ici
                },
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
