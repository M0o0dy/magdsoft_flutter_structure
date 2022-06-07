import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/form_field_cubit/states.dart';




class FormFieldCubit extends Cubit<FormFieldStates> {
  FormFieldCubit() : super(LoginInitialState());

  static FormFieldCubit get(context) => BlocProvider.of(context);


  IconData suffixIcon = Icons.visibility;
  bool isPassword = true;

  void changeVisibility() {
    isPassword = !isPassword;

    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginVisibilityState());
  }

  IconData confirmedPasswordSuffixIcon = Icons.visibility;
  bool isConfirmPassword = true;

  void changeConfirmVisibility() {
    isConfirmPassword = !isConfirmPassword;

    confirmedPasswordSuffixIcon =
    isConfirmPassword ? Icons.visibility : Icons.visibility_off;
    emit(RegisterVisibilityState());
  }
}
