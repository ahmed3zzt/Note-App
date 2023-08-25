import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkir_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:tazkir_app/models/note_model.dart';

import 'custom_app_bar.dart';
import 'custom_input.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? eTitle;

  String? eSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      custom_app_bar(
        title: 'Edit',
        icon: Icon(Icons.check),
        onBtnClick: () {
          if (eTitle == null && eSubTitle == null) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          } else if (eTitle == null) {
            widget.note.subTitle = eSubTitle!;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          } else if (eSubTitle == null) {
            widget.note.title = eTitle!;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          } else {
            widget.note.title = eTitle!;
            widget.note.subTitle = eSubTitle!;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          }
        },
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomInput(
              hint: widget.note.title,
              onChange: (value) {
                eTitle = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              onChange: (value) {
                eSubTitle = value;
              },
              hint: widget.note.subTitle,
              maxLines: 8,
            ),
          ],
        ),
      )
    ]);
  }
}
