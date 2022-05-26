import 'package:bytebank_armazenamento/database/app_database.dart';
import 'package:bytebank_armazenamento/database/dao/contact_dao.dart';
import 'package:bytebank_armazenamento/models/contact.dart';
import 'package:bytebank_armazenamento/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  State<ContactList> createState() => _ContactListState();
  final ContactDao _dao = ContactDao();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: List.empty(growable: true),
          future: widget._dao.findAll(),
          builder: (context, AsyncSnapshot<List<Contact>> snapshot) {

            switch(snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text('Loading')
                      ],
                    ),
                );
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data??[];

                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact);
                  },
                  itemCount: contacts.length,
                );
            }

            return Text('Não foi possível encontrar contatos.');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ContactForm()))
              .then((newContact) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );;
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name, style: TextStyle(fontSize: 24),),
        subtitle: Text(
          contact.accountNumber.toString(), style: TextStyle(fontSize: 16),),
      ),
    );
  }
}