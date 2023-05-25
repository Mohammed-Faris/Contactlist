import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc1/models/contactmodel.dart';

import '../bloc/contact_bloc.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
        ),
        body: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            if (state is ContactsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ContactsLoaded) {
              final tabs = state.users;
              return DefaultTabController(
                length: tabs.length,
                child: Column(
                  children: [
                    TabBar(
                      tabs: _buildTabBarTabs(tabs),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: _buildTabBarViews(tabs, context),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is ContactsError) {
              return const Center(
                child: Text('Something Went Wrong!'),
              );
            }
            return Container();
          },
        ));
  }

  List<Widget> _buildTabBarTabs(List<List<UserModel>> tabs) {
    return tabs.map((tabItems) {
      return Tab(
        text: 'Tab ${tabs.indexOf(tabItems) + 1}',
      );
    }).toList();
  }

  List<Widget> _buildTabBarViews(List<List<UserModel>> tabs, context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return tabs.map((tabItems) {
      return ListView.builder(
        itemCount: tabItems.length,
        itemBuilder: (context, index) {
          final item = tabItems[index];
          return Container(
            margin: EdgeInsets.only(bottom: height * 0.01),
            padding: const EdgeInsets.only(right: 8, left: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item.contacts,
              ),
              trailing: const Icon(Icons.person),
            ),
          );
        },
      );
    }).toList();
  }
}
