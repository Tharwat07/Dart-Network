import 'package:network_layer/network/network_service.dart';
import 'network/network_config.dart';

void main() {
  final authProvider = AuthProvider();
  authProvider.signIn('userName', 'password');
}

class AuthProvider extends NetworkService {
  Future<Map> signIn(String userName, String password) async {
    final response = await callAPI(
      Method.GET,
      'YOUR_ENDPOINT',
    );
    return response;
  }
}
