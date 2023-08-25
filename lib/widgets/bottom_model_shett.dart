import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkir_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:tazkir_app/cubits/notes_cubit/notes_cubit.dart';
import 'fotm_note_model.dart';

class CustomModelBottomSheet extends StatelessWidget {
  const CustomModelBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubitCubit(),
      child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteCubitFailure) {
            print("failled ${state.errMassege}");
          } else if (state is AddNoteCubitSuccess) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNoteCubitLoading ? true : false,
              child: const FormNoteModel());
        },
      ),
    );
  }
}
