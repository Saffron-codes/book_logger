part of 'collection_detailed_page_bloc.dart';

class CollectionDetailedPageState {
  final int collectionCount;
  final bool isNew;

  const CollectionDetailedPageState({
    this.collectionCount = 0,
    this.isNew = true,
  });

  CollectionDetailedPageState copyWith({
    int? collectionCount,
    bool? isNew,
  }) {
    return CollectionDetailedPageState(
      collectionCount: collectionCount ?? this.collectionCount,
      isNew: isNew ?? this.isNew,
    );
  }
}
