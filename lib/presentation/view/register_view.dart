import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/form_field_cubit/cubit.dart';
import '../../business_logic/form_field_cubit/states.dart';
import '../../business_logic/global_cubit/global_cubit.dart';
import '../widget/default_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget registerView({
  required context,
  required TextEditingController fullNameController,
  required TextEditingController registerEmailController,
  required TextEditingController phoneController,
  required TextEditingController registerPasswordController,
  required TextEditingController confirmPasswordController,
}) =>
    BlocConsumer<FormFieldCubit, FormFieldStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = FormFieldCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 25),
            child: Column(
              children: [
                defaultFormField(
                  controller: fullNameController,
                  label: AppLocalizations.of(context)!.fullName,
                  keyboard: TextInputType.name,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.nameFieldEmpty;
                    }
                    return null;
                  },
                ),
                defaultFormField(
                  controller: registerEmailController,
                  label: AppLocalizations.of(context)!.email,
                  keyboard: TextInputType.emailAddress,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.emailFieldEmpty;
                    }
                    return null;
                  },
                ),
                defaultFormField(
                  controller: phoneController,
                  label: AppLocalizations.of(context)!.phone,
                  keyboard: TextInputType.phone,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.phoneFieldEmpty;
                    }
                    return null;
                  },
                ),
                defaultFormField(
                  controller: registerPasswordController,
                  label: AppLocalizations.of(context)!.password,
                  keyboard: TextInputType.visiblePassword,
                  isPassword: cubit.isPassword,
                  suffixIcon: cubit.suffixIcon,
                  suffixPressed: () {
                    cubit.changeVisibility();
                  },
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.passwordFieldEmpty;
                    }
                    return null;
                  },
                ),
                defaultFormField(
                  controller: confirmPasswordController,
                  label: AppLocalizations.of(context)!.confirmPassword,
                  keyboard: TextInputType.visiblePassword,
                  isPassword: cubit.isConfirmPassword,
                  suffixIcon: cubit.confirmedPasswordSuffixIcon,
                  suffixPressed: () {
                    cubit.changeConfirmVisibility();
                  },
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!
                          .confirmPasswordFieldEmpty;
                    } else if (value != registerPasswordController.text) {
                      return AppLocalizations.of(context)!.wrongPassword;
                    }
                  },
                ),
              ],
            ),
          );
        });
