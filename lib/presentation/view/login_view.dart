

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/form_field_cubit/cubit.dart';
import '../../business_logic/form_field_cubit/states.dart';
import '../widget/default_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget loginView({
  required context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
})=> BlocConsumer<FormFieldCubit,FormFieldStates>(
  listener: (context,state){},
  builder: (context,state)
  {
    var cubit = FormFieldCubit.get(context);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 63, vertical: 50),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: emailController,
                      label: AppLocalizations.of(context)!.email,
                      keyboard: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .emailFieldEmpty;
                        }
                        return null;
                      },
                    ),
                    defaultFormField(
                      controller: passwordController,
                      label: AppLocalizations.of(context)!.password,
                      keyboard: TextInputType.visiblePassword,
                      isPassword: cubit.isPassword,
                      suffixIcon: cubit.suffixIcon,
                      suffixPressed: () {
                        cubit.changeVisibility();
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .passwordFieldEmpty;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              );
            });