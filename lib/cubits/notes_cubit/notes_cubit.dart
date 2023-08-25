import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:tazkir_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  getNotes() {
    var notesBox = Hive.box<NoteModel>('notes_box');
    notes = notesBox.values.toList();
    emit(NotesSucces());
  }
}
