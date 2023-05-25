part of 'contact_bloc.dart';

abstract class ContactState {}

class ContactsInitial extends ContactState {}

class ContactsLoading extends ContactState {}

class ContactsLoaded extends ContactState {
  final List<List<UserModel>> users;

  ContactsLoaded(this.users);
}

class ContactsError extends ContactState {
  final String errorMessage;

  ContactsError(this.errorMessage);
}
