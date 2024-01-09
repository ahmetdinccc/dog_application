import 'package:dog_application/Models/dog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_application/Bloc/dog_state.dart';
import 'package:dog_application/Repository/dog_repository.dart';

class DogCubit extends Cubit<DogState> {
  final DogRepository _dogRepository;
  DogCubit(this._dogRepository) : super(DogInitial());

  List<Dog> dogList = [];

  Future<void> getDog() async {
    try {
      emit(DogLoading());
      final response = await _dogRepository.getDog();
      dogList = response;
      emit(DogCompleted(response));
    } on NetworkError catch (_) {
      emit(DogError("Try Searching with another word"));
    }
  }

  Future<void> searchDog(String name) async {
    try {
      emit(DogLoading());

      final List<Dog> newList =
          dogList.where((element) => element.breedName.contains(name)).toList();

      emit(DogCompleted(newList));
    } on NetworkError catch (e) {
      if (int.tryParse(e.statusCode) == 404) {
        emit(DogError("Error"));
      } else {
        emit(DogError("Try searching with another word"));
      }
    }
  }
}
