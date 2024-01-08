import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_application/Bloc/dog_state.dart';
import 'package:dog_application/Repository/dog_repository.dart';

class DogCubit extends Cubit<DogState> {
  final DogRepository _dogRepository;
  DogCubit(this._dogRepository) : super(DogInitial());

  Future<void> getDog() async {
    try {
      emit(DogLoading());
      final response = await _dogRepository.getDog();
      emit(DogCompleted(response));
    } on NetworkError catch (_) {
      emit(DogError("Try Searching with another word"));
    }
  }
}
