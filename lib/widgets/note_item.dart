import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkir_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:tazkir_app/models/note_model.dart';

import '../views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel? note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditNoteView(
                      note: note!,
                    )))
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 4.0, left: 16.0, right: 16.0, bottom: 6),
        child: Container(
            decoration: BoxDecoration(
              color: Color(note!.color),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        note!.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(right: 24.0, bottom: 8, top: 16),
                      child: Text(note!.subTitle,
                          style:
                              TextStyle(color: Colors.black38, fontSize: 17)),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 28,
                      ),
                      color: Colors.black,
                      onPressed: () {
                        note!.delete();
                        BlocProvider.of<NotesCubit>(context).getNotes();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, right: 16.0, bottom: 8),
                    child: Text(note!.date,
                        style: TextStyle(color: Colors.black38)),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
