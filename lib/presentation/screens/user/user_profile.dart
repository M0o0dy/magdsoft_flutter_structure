import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/navigator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserScreen extends StatelessWidget {
  late AccountModel accountModel;

   UserScreen(this.accountModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GlobalCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title:  Text(AppLocalizations.of(context)!.userData,),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 8),
                        child: Text(
                          '${AppLocalizations.of(context)!.name} : ${accountModel.account![0].name}',
                          style: TextStyle(fontSize: 25, color: AppColor.blue),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 8),
                        child: Text(
                          '${AppLocalizations.of(context)!.email} : ${accountModel.account![0].email}',
                          style: TextStyle(fontSize: 25, color: AppColor.blue),
                        ),
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.phone} : ${accountModel.account![0].phone}',
                        style: TextStyle(fontSize: 25, color: AppColor.blue),
                      ),
                    ],
                  ),
                  const Spacer(),
                  defaultButton(
                    label: AppLocalizations.of(context)!.logout,
                    onPressed: () {
                      navigateAndFinishTo(context, const LoginScreen());
                    },
                    color: AppColor.red,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
