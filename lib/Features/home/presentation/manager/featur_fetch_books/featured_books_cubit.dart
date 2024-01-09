import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:books_online/Features/home/domain/data/use%20cases/fetch_feature_books_use_case.dart';
import 'package:books_online/Features/home/domain/data/use%20cases/use_case.dart';
import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/Features/home/domain/entities/repo/home_repo.dart';
import 'package:books_online/core/errors/error.dart';
import 'package:meta/meta.dart';

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
