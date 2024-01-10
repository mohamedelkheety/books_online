import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_online/Features/home/domain/data/use%20cases/fetch_feature_books_use_case.dart';
import 'package:books_online/Features/home/domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeatureBooksUseCase featureBooksUseCase;
  FeaturedBooksCubit(this.featureBooksUseCase) : super(FeaturedBooksInitial());
  Future<void> fetchFeatureBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featureBooksUseCase.call();
    result.fold(
      (fialure) => emit(FeaturedBooksFialure(fialure.errorMassge)),
      (books) => emit(
        FeaturedBooksSuccess(books),
      ),
    );
  }
}
