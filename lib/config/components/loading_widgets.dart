import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidgets extends StatefulWidget {
  final double? size;

  const LoadingWidgets({super.key, this.size});

  @override
  State<LoadingWidgets> createState() => _LoadingWidgetsState();
}

class _LoadingWidgetsState extends State<LoadingWidgets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Platform.isAndroid
          ? const CircularProgressIndicator()
          : const CupertinoActivityIndicator(),
    );
  }
}
