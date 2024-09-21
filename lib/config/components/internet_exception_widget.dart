import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback? onPress;

  const InternetExceptionWidget({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
                "we're unable to show results.\nPlease check your data\nconnection",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 20)),
          ),
        ),
        ElevatedButton(
            onPressed: onPress,
            child: Text(
              'RETRY',
              style: Theme.of(context).textTheme.bodySmall,
            ))
      ],
    );
  }
}
