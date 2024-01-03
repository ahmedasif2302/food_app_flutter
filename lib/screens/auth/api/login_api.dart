import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class LoginApi {
  Future<List> getAllPosts(page) async {
    page ??= 0;
    String endpoint = 'https://reqres.in/api/users?page=1&per_page=12';
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['data'];
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class UsersNotifier extends StateNotifier<Map<String, dynamic>> {
  UsersNotifier(this.ref)
      : super({'isLoading': true, 'users': [], 'total': 0}) {
    fetchUsers(1);
  }
  final Ref ref;

  Future<void> fetchUsers(page) async {
    page ??= 0;
    String endpoint = 'https://reqres.in/api/users?page=1&per_page=10';
    state = {...state, "isLoading": true};
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['data'];
      var total = jsonDecode(response.body)['total'];
      state = {...state, "users": result, "total": total, "isLoading": false};
    } else {
      state = {...state, "users": [], "total": 0, "isLoading": false};
      throw Exception(response.reasonPhrase);
    }
  }
}

final usersProvider = StateNotifierProvider((ref) {
  return UsersNotifier(ref);
});

final loginProvider = Provider<LoginApi>((ref) => LoginApi());

final loginFutureProvider =
    FutureProvider.autoDispose.family((ref, page) async {
  return ref.watch(loginProvider).getAllPosts(page);
});
