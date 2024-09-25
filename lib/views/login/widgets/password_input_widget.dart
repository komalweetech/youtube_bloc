import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youyube_bloc/utils/validations.dart';

import '../../../bloc/login/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;

  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current,previous) => current.password != previous.password,
      builder: (context, state) {
        print('password build');
        return TextFormField(
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode,
          obscureText: true,
          decoration: InputDecoration(
              hintStyle:
              const TextStyle(fontSize: 15, color: Colors.black),
              hintText: 'Password',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.shade700,
                  ))),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChange(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            }
            // if(!Validations.passwordValidator(value)){
            //   return 'Please enter password greater than 6 char';
            // }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
