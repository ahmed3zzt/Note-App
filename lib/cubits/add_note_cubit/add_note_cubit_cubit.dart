import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tazkir_app/models/note_model.dart';
part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());

  int color = Colors.amber.value;
  addNote(NoteModel note) {
    note.color = color;
    emit(AddNoteCubitLoading());

    try {
      var notesBox = Hive.box<NoteModel>('notes_box');
      emit(AddNoteCubitSuccess());
      notesBox.add(note);
    } catch (e) {
      emit(AddNoteCubitFailure(e.toString()));
    }
  }
}
