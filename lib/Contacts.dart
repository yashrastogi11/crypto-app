import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'dart:async';
import 'package:contacts_service/contacts_service.dart';

Permission permissionFromString(String value) {
  Permission permission;
  for (Permission item in Permission.values) {
    if(item.toString() == value) {
      permission = item;
      break;
    }
  }

  return permission;
}


void main() async {
  await SimplePermissions.requestPermission(permissionFromString( 'Permission.ReadContacts' ) );
  await SimplePermissions.requestPermission(permissionFromString( 'Permission.WriteContacts' ) );

}

class Contacts extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<Contacts> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _create() async {
    Contact contact = new Contact(
      familyName: 'xyz',
      givenName: 'abc',
      emails: [new Item(label: 'work', value: 'yashrastogi11@gmail.com')],
      phones: [new Item(label: "personal", value: "8094696587")]
    );
    await ContactsService.addContact(contact);
    showInSnackbar('Created contact');
  }

  void _find() async {
    Iterable<Contact> people = await ContactsService.getContacts(query: 'abc');
    showInSnackbar('There are ${people.length} people named abc');
  }

  void _read() async {
    Iterable<Contact> people = await ContactsService.getContacts(query: 'abc xyz');
    Contact contact = people.first;
    showInSnackbar('abc email is ${contact.emails.first.value}');
  }

  void _delete() async {
    Iterable<Contact> people = await ContactsService.getContacts(query: 'abc xyz');
    Contact contact = people.first;

    await ContactsService.deleteContact(contact);
    showInSnackbar('abc deleted');
  }

  void showInSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Contacts"),
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text("Cntacts"),
              new RaisedButton(onPressed: _create, child: new Text("Create"),),
              new RaisedButton(onPressed: _find, child: new Text("Find"),),
              new RaisedButton(onPressed: _read, child: new Text("Read"),),
              new RaisedButton(onPressed: _delete, child: new Text("Delete"),),
            ],
          ),
        ),
      ),
    );
  }
}