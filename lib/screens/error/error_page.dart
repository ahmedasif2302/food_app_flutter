import 'package:flutter/material.dart';
import 'package:food_app/common/widgets/header.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String? errorMessage;
  const ErrorPage(this.errorMessage, {super.key, thi});

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Screen not found',
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Something went wrong"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/home');
                  },
                  child: const Text('Relod')),
            ),
          ],
        ),
      ),
    );
  }
}
