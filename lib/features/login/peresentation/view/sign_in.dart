// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'package:apinoteapp/features/login/peresentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../core/widget/defult_button.dart';
import '../../../../core/widget/defult_form_field.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  GlobalKey<FormState> fromKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpcolor,
      body: Form(
          key: fromKey,
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
                  hint: 'Email',
                  validate: (val) {
                    if (val!.isEmpty) {
                      return 'mustn\'t be Empty';
                    } else if (val.isEmpty) {
                      return 'must be more than 15';
                    } else if (val.length > 50) {
                      return 'must be less than 50';
                    }
                  },
                  controller: emailController,
                ),
                DefultField(
                    controller: passController,
                    hint: 'PassWord',
                    validate: (val) {
                      if (val!.isEmpty) {
                        return 'mustn\'t be Empty';
                      } else if (val.isEmpty) {
                        return 'must be more than 15';
                      } else if (val.length > 50) {
                        return 'must be less than 50';
                      }
                    }),
                DefultButton(
                  text: 'Sign In',
                  color: Colors.white,
                  overlaycolor: kscolor,
                  onpressed: () {
                    if (fromKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).signIn(
                          linkSigninserver,
                          {
                            'email': emailController.text,
                            'password': passController.text
                          },
                          context);
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'haven\'t an accunt?',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign Up',
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ],
          )),
    );
  }
}
