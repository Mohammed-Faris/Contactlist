import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/contactmodel.dart';
import '../repositories/contactrepo.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactsEvent, ContactState> {
  final UserRepository _userRepository;

  ContactBloc(this._userRepository) : super(ContactsLoading()) {
    on<FetchContacts>((event, emit) async {
      emit(ContactsLoading());
      try {
        final watchlist = await _userRepository.getUsers();
        final tabs = _splitItemsIntoTabs(watchlist);
        emit(ContactsLoaded(tabs));
        emit(FilterdState(filteredusers: tabs, currentTabIndex: 0));
      } catch (e) {
        emit(ContactsError('Something Went Wrong!'));
      }
    });

    on<OnSortEvent>((event, emit) {
      emit(ContactsLoading());
      if (event.selectedSort == 'asc') {
        emit(FilterdState(
            filteredusers: event.filteredusers.map((e) {
              if (event.currentTabIndex == event.filteredusers.indexOf(e)) {
                return e
                  ..sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
              }
              return e;
            }).toList(),
            currentTabIndex: event.currentTabIndex,
            selectedSort: event.selectedSort));
      } else if (event.selectedSort == 'dsc') {
        emit(FilterdState(
            filteredusers: event.filteredusers.map((e) {
              if (event.currentTabIndex == event.filteredusers.indexOf(e)) {
                return e
                  ..sort((a, b) => int.parse(b.id).compareTo(int.parse(a.id)));
              }
              return e;
            }).toList(),
            currentTabIndex: event.currentTabIndex,
            selectedSort: event.selectedSort));
      }
    });
  }

  List<List<UserModel>> _splitItemsIntoTabs(List<UserModel> items) {
    final tabs = <List<UserModel>>[];
    for (int i = 0; i < items.length; i += 30) {
      final endIndex = i + 30;
      final sublist =
          items.sublist(i, endIndex > items.length ? items.length : endIndex);
      tabs.add(sublist);
    }
    return tabs;
  }
}
