// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'package:apinoteapp/constant.dart';
import 'package:apinoteapp/features/login/peresentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:apinoteapp/features/login/data/repo/repo_imp.dart';
import 'package:apinoteapp/features/login/peresentation/view/sign_in.dart';
import 'package:apinoteapp/features/login/peresentation/view/sign_up_widget/Text_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/defult_button.dart';
import '../../../../core/widget/defult_form_field.dart';
import '../manager/login_cubit/login_state.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  GlobalKey<FormState> fromKey2 = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  SignRepoImp repo = SignRepoImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpcolor,
      body: Form(
          key: fromKey2,
          child: ListView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Image.asset(
                    'images/rafiki.png',
                  ),
                ),
                DefultField(
                  validate: (val) {
                    if (val!.isEmpty) {
                      return 'mustn\'t be Empty';
                    } else if (val.length < 3) {
                      return 'must be more than 3';
                    } else if (val.length > 50) {
                      return 'must be less than 50';
                    }
                  },
                  controller: usernameController,
                  hint: 'UserName',
                ),
                DefultField(
                  validate: (val) {
                    if (val!.isEmpty) {
                      return 'mustn\'t be Empty';
                    } else if (val.length < 12) {
                      return 'must be more than 1';
                    } else if (val.length > 50) {
                      return 'must be less than 50';
                    }
                  },
                  controller: emailController,
                  hint: 'Email',
                ),
                DefultField(
                  validate: (val) {
                    if (val!.isEmpty) {
                      return 'mustn\'t be Empty';
                    } else if (val.length < 8) {
                      return 'must be more than 8';
                    } else if (val.length > 50) {
                      return 'must be less than 50';
                    }
                  },
                  controller: passController,
                  hint: 'PassWord',
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return DefultButton(
                        color: Colors.white,
                        overlaycolor: kscolor,
                        text: 'Sign Up',
                        onpressed: () async {
                          if (fromKey2.currentState!.validate()) {
                            await BlocProvider.of<LoginCubit>(
                              context,
                            ).signUp(
                                linkSignUpserver,
                                {
                                  'username': usernameController.text,
                                  'password': passController.text,
                                  'email': emailController.text,
                                },
                                context);
                          }
                        });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButtonWidget(
                  text: 'Sign Up',
                  subtext: "Already have an acconut",
                  nav: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                )
              ]),
            ],
          )),
    );
  }
}
