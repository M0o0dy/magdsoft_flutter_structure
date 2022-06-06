import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/main.dart';

import '../../constants/end_points.dart';
import '../../data/local/cache_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

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

  late AccountModel accountModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, body: {
      'email':email,
      'password':password
    }).then((value){
      accountModel = AccountModel.fromJson(value.data);
      emit(LoginSuccessState(accountModel));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
      print('error is ${error.toString()}');
    });
  }
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, body: {
      'email':email,
      'password':password,
      'name':name,
      'phone':phone,
    }).then((value){
      accountModel = AccountModel.fromJson(value.data);
      emit(RegisterSuccessState(accountModel));

    }).then((value){
      userLogin(email: email, password: password);
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
      print('error is ${error.toString()}');
    });
  }

  bool isLoginView = true;
  void changeView(){
    isLoginView = !isLoginView;
    emit(ChangeViewState());
  }


  Future<void> changeLang(context)async {
    if(AppLocalizations.of(context)!.localeName == 'en'){
      await delegate.changeLocale(const Locale('ar')).then((value){
        CacheHelper.saveDataSharedPreference(key: 'language', value: "ar");
        emit(ChangeToArLangState());
      }).catchError((error){
        emit(ErrorChangeLangState());
        print('error is ${error.toString()}');
      });
    }else{
      await delegate.changeLocale(const Locale('en')).then((value){
        CacheHelper.saveDataSharedPreference(key: 'language', value: "en");
        emit(ChangeToEnLangState());
      }).catchError((error){
        emit(ErrorChangeLangState());
        print('error is ${error.toString()}');
      });
    }
  }
}
