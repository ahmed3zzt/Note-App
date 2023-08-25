part of 'add_note_cubit_cubit.dart';

abstract class AddNoteCubitState {}

class AddNoteCubitInitial extends AddNoteCubitState {}

class AddNoteCubitLoading extends AddNoteCubitState {}

class AddNoteCubitSuccess extends AddNoteCubitState {}

class AddNoteCubitFailure extends AddNoteCubitState {
  final String errMassege;

  AddNoteCubitFailure(this.errMassege);
}
