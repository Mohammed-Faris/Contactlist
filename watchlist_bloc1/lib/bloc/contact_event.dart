part of 'contact_bloc.dart';

abstract class ContactsEvent {
  const ContactsEvent();
}

class FetchContacts extends ContactsEvent {}
