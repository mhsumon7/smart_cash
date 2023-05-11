import 'package:flutter/material.dart';

class EmptyFailureNoInternetView extends StatelessWidget {
  final VoidCallback onPressed;
  const EmptyFailureNoInternetView(
      {Key? key,
      required this.onPressed,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: Text('No Internet'),
      ),
    );
  }
}
