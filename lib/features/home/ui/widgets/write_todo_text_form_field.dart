import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/styles.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';

class WriteTodoTextFormField extends StatefulWidget {
  const WriteTodoTextFormField({super.key});

  @override
  State<WriteTodoTextFormField> createState() => _WriteTodoTextFormFieldState();
}

class _WriteTodoTextFormFieldState extends State<WriteTodoTextFormField> {
  final double border = 15;
  bool stopMaxLine = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 200),
      child: TextFormField(
        autofocus: true,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        controller: context.read<WriteTodoCubit>().todoController,
        cursorOpacityAnimates: true,
        cursorColor: ColorsManager.secondaryColor,
        decoration: _inputDecoration(),
        maxLines: stopMaxLine ? null : 3,
        validator: (value) {
          return '';
        },
        onChanged: (value) {
          controlMaxLine(value);
        },
        style: TextStyles.font18secondaryColorBold,
      ),
    );
  }

  void controlMaxLine(String value) {
    if (value.length == 87) {
      stopMaxLine = false;
      setState(() {});
    } else if (value.length <= 87) {
      stopMaxLine = true;
      setState(() {});
    }
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 17,
        horizontal: 20,
      ),
      hintStyle: TextStyles.font18secondaryColorBold,
      hintText: 'New Todo',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(border),
        borderSide: BorderSide(
          color: ColorsManager.secondaryColor,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(border),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.3,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(border),
        borderSide: const BorderSide(color: Colors.red, width: 1.3),
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 19.h,
          horizontal: 20.w,
        ),
        child: FaIcon(
          FontAwesomeIcons.filePen,
          size: 20.w,
          color: ColorsManager.secondaryColor,
        ),
      ),
      isDense: true,
      filled: true,
      fillColor: ColorsManager.white.withOpacity(0.1),
    );
  }
}
