import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkir_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:tazkir_app/models/note_model.dart';

import 'note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return notes.isEmpty
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 50),
                child: Text(
                  'There No Data 😥',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteItem(
                    note: notes[index],
                  );
                });
      },
    );
  }
}
