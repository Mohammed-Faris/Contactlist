import 'package:flutter/material.dart';

import '../models/contactmodel.dart';

class ContactList extends StatelessWidget {
  final Iterable<UserModel> contactList;
  const ContactList({super.key, required this.contactList});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromARGB(255, 239, 239, 239),
      width: width,
      padding: const EdgeInsets.all(8.0),
      child: contactList.isEmpty
          ? const Center(
              child: Text('No User Found'),
            )
          : ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                var name = contactList.elementAt(index).name;
                var contact = contactList.elementAt(index).contacts;
                // var img = contactList[index].url;
                return Container(
                  margin: EdgeInsets.only(bottom: height * 0.01),
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      contact,
                    ),
                    trailing: const Icon(Icons.person),
                  ),
                );
              }),
    );
  }
}
