part of 'contact_bloc.dart';

abstract class ContactsEvent {
  const ContactsEvent();
}

class FetchContacts extends ContactsEvent {}

class OnSortEvent extends ContactsEvent {
  final List<List<UserModel>> filteredusers;

  final int currentTabIndex;

  final String? selectedSort;
  const OnSortEvent(
      {required this.filteredusers,
      required this.currentTabIndex,
      this.selectedSort});
}
