import 'package:bloc/bloc.dart';
import 'package:book_logger/services/database_service.dart';
import 'package:meta/meta.dart';

part 'collection_detailed_page_event.dart';
part 'collection_detailed_page_state.dart';

class CollectionDetailedPageBloc
    extends Bloc<CollectionDetailedPageEvent, CollectionDetailedPageState> {
  final DatabaseService databaseService;
  CollectionDetailedPageBloc({
    required this.databaseService,
  }) : super(const CollectionDetailedPageState()) {
    on<CollectionDetailedPageLoadNew>((event, emit) async {
      final collectionCount = await databaseService.getCollectionCount();
      emit(state.copyWith(
        collectionCount: collectionCount,
      ));
    });
  }
}
