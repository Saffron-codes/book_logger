import 'package:book_logger/blocs/collection_detailed_page_bloc/collection_detailed_page_bloc.dart';
import 'package:book_logger/pages/collection_detailed_page.dart';
import 'package:book_logger/pages/home_page.dart';
import 'package:book_logger/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookLoggerApp extends StatelessWidget {
  final DatabaseService databaseService;
  const BookLoggerApp({
    super.key,
    required this.databaseService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CollectionDetailedPageBloc(
            databaseService: databaseService,
          ),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => HomePage(),
          '/collection': (_) => CollectionDetailedPage(),
        },
      ),
    );
  }
}
