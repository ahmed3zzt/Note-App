import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkir_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:tazkir_app/models/note_model.dart';

import 'custom_btn.dart';
import 'custom_input.dart';

class FormNoteModel extends StatefulWidget {
  const FormNoteModel({
    super.key,
  });

  @override
  State<FormNoteModel> createState() => _FormNoteModelState();
}

class _FormNoteModelState extends State<FormNoteModel> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: SingleChildScrollView(
          child: Column(children: [
            CustomInput(
              maxLines: 1,
              hint: 'Title',
              onSave: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: 'Content',
              maxLines: 6,
              onSave: (value) {
                subTitle = value;
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: ColorsList(),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<AddNoteCubitCubit, AddNoteCubitState>(
              builder: (context, state) {
                return CustomBtn(
                  isLoading: state is AddNoteCubitLoading ? true : false,
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      NoteModel noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date:
                              '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ',
                          color: Colors.cyan.shade200.value);
                      BlocProvider.of<AddNoteCubitCubit>(context)
                          .addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});
  final int color;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 29,
              backgroundColor: Color(color),
            ),
          )
        : CircleAvatar(
            radius: 32,
            backgroundColor: Color(color),
          );
  }
}

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  final List<int> colors = [
    Colors.amber.value,
    Colors.cyan.value,
    Colors.red.value,
    Colors.teal.value,
    Colors.blueGrey.value,
    Colors.brown.value,
    Colors.deepPurple.value,
    Colors.green.value,
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});

                  BlocProvider.of<AddNoteCubitCubit>(context).color =
                      colors[currentIndex];
                },
                child: ColorItem(
                  color: colors[index],
                  isActive: currentIndex == index,
                ),
              ));
        },
      ),
    );
  }
}
