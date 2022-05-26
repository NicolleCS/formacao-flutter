import 'package:sqflite/sqflite.dart';

import '../../models/contact.dart';
import '../app_database.dart';

class ContactDao {

  static const String tableSql = 'CREATE TABLE $_tableName ('
      'id INTEGER PRIMARY KEY, '
      'name TEXT,'
      'account_number INTEGER )';
  static const String _tableName = 'contacts';

  Future<int> save(Contact contact) async {
    final Database database = await createDatabase();
    Map<String, dynamic> contactMap = toMap(contact);

    return database.insert(_tableName, contactMap);
  }

  Map<String, dynamic> toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database database = await createDatabase();

    final List<Map<String,dynamic>> result = await database.query(_tableName);

    List<Contact> contacts = toList(result);

    return contacts;
  }

  List<Contact> toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List<Contact>.empty(growable: true);
    for(Map<String, dynamic> row in result) {
      final Contact contact = Contact(row['id'], row['name'], row['account_number'],);
      contacts.add(contact);
    }
    return contacts;
  }
}