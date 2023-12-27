import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<http.Response> signInWithSpotify() async {
    final response =
        await http.get(Uri.parse('http://localhost:3001/auth/login'));
    print(response.body);
    return response;
  }

  Stream authStateChanges() async* {
    yield null;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
