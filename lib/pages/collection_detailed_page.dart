import 'package:book_logger/blocs/collection_detailed_page_bloc/collection_detailed_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionDetailedPage extends StatelessWidget {
  const CollectionDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _CollectionTitle(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: _Content(),
    );
  }
}

class _CollectionTitle extends StatelessWidget {
  const _CollectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionDetailedPageBloc, CollectionDetailedPageState>(
      buildWhen: (previous, current) =>
          previous.collectionCount != current.collectionCount,
      builder: (context, state) {
        return Text("Collection ${state.collectionCount}");
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionDetailedPageBloc, CollectionDetailedPageState>(
      builder: (context, state) {
        return state.isNew ? _NoBooksContent() : _BooksList();
      },
    );
  }
}

class _NoBooksContent extends StatelessWidget {
  const _NoBooksContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {},
        label: Text("Add your first book"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

class _BooksList extends StatelessWidget {
  const _BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
