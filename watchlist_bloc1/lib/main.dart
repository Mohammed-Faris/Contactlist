import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc1/screens/contactscreen.dart';

import 'bloc/contact_bloc.dart';
import 'repositories/contactrepo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: BlocProvider(
          create: (context) => ContactBloc(
            RepositoryProvider.of<UserRepository>(context),
          )..add(FetchContacts()),
          child: const ContactScreen(),
        ),
      ),
    );
  }
}
