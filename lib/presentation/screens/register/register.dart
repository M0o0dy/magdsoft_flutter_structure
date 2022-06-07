import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/register_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/navigator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../business_logic/global_cubit/global_state.dart';class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) async {

      if (state is LoginSuccessState) {
        navigateAndFinishTo(context, UserScreen(state.accountModel));
      }
    }, builder: (context, state) {
      var registerEmailController = TextEditingController();
      var fullNameController = TextEditingController();
      var phoneController = TextEditingController();
      var registerPasswordController = TextEditingController();
      var confirmPasswordController = TextEditingController();
      var formKey = GlobalKey<FormState>();
      var cubit = GlobalCubit.get(context);
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
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
                        Container(
                          height: 31,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            registerView(
                              context: context,
                              fullNameController: fullNameController,
                              registerEmailController: registerEmailController,
                              phoneController: phoneController,
                              registerPasswordController:
                                  registerPasswordController,
                              confirmPasswordController:
                                  confirmPasswordController,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Conditional.single(
                                    widgetBuilder: (context) =>
                                        defaultButton(
                                          label: AppLocalizations.of(context)!.register,
                                          onPressed: () { if (formKey.currentState!.validate()) {
                                            cubit.userRegister(
                                              name: fullNameController.text,
                                              email: registerEmailController.text,
                                              password: registerPasswordController.text,
                                              phone: phoneController.text,
                                            );

                                          }

                                          },
                                          color: AppColor.blue,
                                        ),
                                    conditionBuilder:(context)=> state is! RegisterLoadingState,
                                    fallbackBuilder: (context)=> const Center(child: CircularProgressIndicator()),
                                    context: context
                                ),

                                const Spacer(),
                                defaultButton(
                                  label: AppLocalizations.of(context)!.login,
                                  onPressed: () {
                                    navigateAndFinishTo(context, LoginScreen());
                                  },
                                  color: AppColor.blue,
                                ),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
