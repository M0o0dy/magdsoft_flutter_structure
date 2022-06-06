import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/register/register.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/login_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/register_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_text_form_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/navigator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            navigateAndFinishTo(
                context,  UserScreen(state.accountModel));
          }
        },
        builder: (context, state) {
          var emailController = TextEditingController();
          var passwordController = TextEditingController();
          var formKey = GlobalKey<FormState>();
          var cubit = GlobalCubit.get(context);
          return Container(
            width: 412,
            height: 870,
            color: AppColor.blue,
            child: SafeArea(
              minimum: const EdgeInsets.only(top: 26),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      color: AppColor.blue,
                      padding: const EdgeInsets.all(21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 84,
                                height: 31,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: MaterialButton(
                                  onPressed: () {
                                    cubit.changeLang(context);

                                  },
                                  color: AppColor.white,
                                  minWidth: 0,
                                  child: Text(
                                      AppLocalizations.of(context)!.localeName == 'en'? 'عربي':'English',
                                    style: TextStyle(
                                        fontSize: 15, color: AppColor.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            width: 227,
                            height: 167,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(50),
                                topEnd: Radius.circular(50)),
                            color: AppColor.white),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               const Spacer(),
                              loginView(
                                      context: context,
                                      emailController: emailController,
                                      passwordController: passwordController,
                                    ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Spacer(),
                                  defaultButton(
                                    label: AppLocalizations.of(context)!.register,

                                    onPressed: () {
                                      navigateAndFinishTo(context, RegisterScreen());

                                    },
                                    color: AppColor.blue,
                                  ),
                                   const Spacer(),
                                  Conditional.single(
                                      widgetBuilder: (context) =>
                                          defaultButton(
                                            label: AppLocalizations.of(context)!.login,
                                            onPressed: () {
                                              if (formKey.currentState!.validate()) {
                                                cubit.userLogin(
                                                    email: emailController.text,
                                                    password: passwordController.text);

                                              }
                                            },
                                            color: AppColor.blue,
                                          ),
                                      conditionBuilder:(context)=> state is! LoginLoadingState,
                                      fallbackBuilder: (context)=> const Center(child: CircularProgressIndicator()),
                                      context: context
                                  ),

                                  const Spacer(),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
