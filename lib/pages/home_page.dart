import 'package:book_logger/blocs/collection_detailed_page_bloc/collection_detailed_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context
              .read<CollectionDetailedPageBloc>()
              .add(CollectionDetailedPageLoadNew());
          Navigator.of(context).pushNamed('/collection');
        },
        label: Text("Collection"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
