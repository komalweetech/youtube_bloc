import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youyube_bloc/config/routes/routes_name.dart';
import 'package:youyube_bloc/utils/enums.dart';
import 'package:youyube_bloc/utils/flush_bar_helper.dart';

import '../../../bloc/login/login_bloc.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;

  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        // for api throw error ...
        if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flushBarErrorMessage(state.apiMessage.toString(), context);
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //       SnackBar(content: Text(state.apiMessage.toString())));
        }
        // for api throw success..
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
          FlushBarHelper.flushBarErrorMessage('Login successful', context);
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //       SnackBar(content: Text(state.apiMessage.toString())));
        }


      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade700,
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print('i am here');
                  context.read<LoginBloc>().add(LoginButton());
                };
              },
              child: state.postApiStatus == PostApiStatus.loading
                  ? const CircularProgressIndicator(color: Colors.white,)
                  : const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ));
        },
      ),
    );
  }
}
