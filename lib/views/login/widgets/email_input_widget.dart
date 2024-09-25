import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youyube_bloc/utils/validations.dart';

import '../../../bloc/login/login_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;

  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current,previous) => current.email != previous.email,
      builder: (context, state) {
        print('email  build');
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: InputDecoration(
              hintStyle:
              const TextStyle(fontSize: 15, color: Colors.black),
              hintText: 'Email',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.shade700,
                  ))),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChange(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Email';
            }
            if(!Validations.emailValidator(value)) {
              return 'Please add correct email';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
