import 'package:books_online/Features/home/domain/data/use%20cases/fetch_newset_books_use_case.dart';
import 'package:books_online/Features/home/presentation/manager/newst_books/newset_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;
  NewsetBooksCubit(this.fetchNewsetBooksUseCase) : super(NewsetBooksInitial());
  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await fetchNewsetBooksUseCase.call();
    result.fold(
      (fialure) => emit(NewsetBooksFialure(fialure.errorMassge)),
      (books) => emit(
        NewsetBooksSuccess(books),
      ),
    );
  }
}
