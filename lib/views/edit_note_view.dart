import 'package:flutter/material.dart';
import 'package:tazkir_app/models/note_model.dart';

import '../widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 45,
        ),
        child: EditNoteViewBody(
          note: note,
        ),
      ),
    );
  }
}
