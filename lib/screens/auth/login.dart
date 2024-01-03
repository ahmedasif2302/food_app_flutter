import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/common/utils/colors.dart';
import 'package:food_app/common/utils/static_image.dart';
import 'package:food_app/common/widgets/header.dart';
import 'package:food_app/screens/auth/api/login_api.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  int page = 0;
  bool hasMore = true;
  bool isLoadingMore = false;
  int? total = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var users = ref.watch(usersProvider) as Map;
    List data = users['users'];
    bool isLoading = users['isLoading'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts data'),
      ),
      body: bodyContent(data, isLoading),
    );
  }
}

Widget bodyContent(List data, bool isLoading) {
  Widget content;
  if (isLoading) {
    content = const Center(
      child: CircularProgressIndicator(),
    );
  } else if (data.isEmpty) {
    content = const Center(
      child: Text('No data found'),
    );
  } else {
    content = ListView.builder(
      itemBuilder: (_, index) {
        return ListTile(
          leading: CircleAvatar(child: Text(data[index]['id'].toString())),
          title: Text(data[index]['email'].toString()),
          subtitle: Text(data[index]['first_name'].toString()),
        );
      },
      itemCount: data.length,
    );
  }
  return content;
}

  // @override
  // Widget build(BuildContext context) {
  //   return Header(
  //     isShowLeading: false,
  //     isShowBottomTab: false,
  //     title: "Login",
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const TextField(
  //             decoration: InputDecoration(
  //               labelText: 'Enter your email',
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           const TextField(
  //             decoration: InputDecoration(
  //               labelText: 'Enter your password',
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               InkWell(
  //                 onTap: () {
  //                   context.pushReplacement('/signup');
  //                 },
  //                 child: Text(
  //                   'Create an account',
  //                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
  //                         color: Theme.of(context).colorScheme.secondary,
  //                       ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   context.push('/forgotpassword');
  //                 },
  //                 child: Text(
  //                   'Forgot your password?',
  //                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
  //                         color: Theme.of(context).colorScheme.secondary,
  //                       ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           SizedBox(
  //             width: double.infinity,
  //             height: 48,
  //             child: ElevatedButton(
  //               style: ButtonStyle(
  //                 textStyle: MaterialStateProperty.all<TextStyle>(
  //                   const TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //               onPressed: () {
  //                 // Add your action here
  //                 GoRouter.of(context).go('/home');
  //               },
  //               child: const Text('Login'),
  //             ),
  //           ),
  //           Column(
  //             children: [
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               const Text('Or Continue using social login'),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     height: 50,
  //                     width: 50,
  //                     padding: const EdgeInsets.all(10),
  //                     decoration: BoxDecoration(
  //                       color: const Color.fromARGB(255, 255, 255, 255),
  //                       borderRadius: BorderRadius.circular(30.0),
  //                     ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Image.network(
  //                           StaticImage.signInWithGoogleImage,
  //                           height: 24,
  //                           width: 24,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   Container(
  //                     height: 50,
  //                     width: 50,
  //                     padding: const EdgeInsets.all(10),
  //                     decoration: BoxDecoration(
  //                       color: const Color.fromARGB(255, 255, 255, 255),
  //                       borderRadius: BorderRadius.circular(30.0),
  //                     ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Image.network(
  //                           StaticImage.facebookImage,
  //                           height: 24,
  //                           width: 24,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
