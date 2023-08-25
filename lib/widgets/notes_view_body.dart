import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkir_app/cubits/notes_cubit/notes_cubit.dart';

import 'bottom_model_shett.dart';
import 'custom_app_bar.dart';
import 'list_view.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({
    super.key,
  });

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 45,
        ),
        child: Column(
          children: [
            custom_app_bar(
              title: 'Notes',
              icon: Icon(Icons.search),
              onBtnClick: () {},
            ),
            Expanded(child: NoteListView()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) {
                return const CustomModelBottomSheet();
              });
        },
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 62, 62, 62),
        child: const Icon(Icons.add),
      ),
    );
  }
}
