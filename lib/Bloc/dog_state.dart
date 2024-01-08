import 'package:flutter/foundation.dart';
import 'package:dog_application/Models/dog.dart';

abstract class DogState {
  DogState();
}

class DogInitial extends DogState {
  DogInitial();
}

class DogLoading extends DogState {
  DogLoading();
}

class DogCompleted extends DogState {
  final List<Dog> response;
  DogCompleted(this.response);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DogCompleted && listEquals(other.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class DogError extends DogState {
  final String message;
  DogError(this.message);
}
