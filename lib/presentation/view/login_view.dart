

import 'package:flutter/material.dart';

import '../../business_logic/global_cubit/global_cubit.dart';
import '../widget/default_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget loginView({
  required context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
})=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 63,vertical: 50),
  child: Column(
    children: [

      defaultFormField(
        controller: emailController,
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
        controller: passwordController,
        label: AppLocalizations.of(context)!.password,
        keyboard: TextInputType.visiblePassword,
        isPassword: GlobalCubit.get(context).isPassword,
        suffixIcon: GlobalCubit.get(context).suffixIcon,
        suffixPressed: (){GlobalCubit.get(context).changeVisibility();},
        validate: (String? value) {
          if (value!.isEmpty) {
            return AppLocalizations.of(context)!.passwordFieldEmpty;
          }
          return null;
        },
      ),
    ],
  ),
);