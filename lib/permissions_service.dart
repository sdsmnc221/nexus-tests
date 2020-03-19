import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

class AskForPermission extends StatefulWidget {
  @override
  _AskForPermissionState createState() => _AskForPermissionState();
}

class _AskForPermissionState extends State<AskForPermission> {
  Map<PermissionGroup, PermissionStatus> permissions;
  Iterable<Contact> contacts;
  @override
  void initState() {
    super.initState();
    getPermissions();
    getContacts();
    print('contacts');
    print(contacts);
  }

  void getPermissions() async {
    permissions = await PermissionHandler().requestPermissions([
      PermissionGroup.contacts
      // PermissionGroup.location,
      // PermissionGroup.camera,
      // PermissionGroup.locationAlways,
      // PermissionGroup.phone,
      // PermissionGroup.sensors,
      // PermissionGroup.storage,
      // PermissionGroup.microphone,
    ]);
  }

  void getContacts() async {
    contacts = await ContactsService.getContacts(withThumbnails: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEXUS'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
