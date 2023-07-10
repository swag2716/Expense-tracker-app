import 'package:personal_expenses_app/storage/auth_storage.dart';
import 'package:http/http.dart' as http;

Future<TokenStatus> isUserLoggedIn() async {
  String url = "http://192.168.29.116:9000/transaction";
  final tokenManager = TokenManager();
  final accessToken = await tokenManager.getAccessToken();
  final refreshToken = await tokenManager.getRefreshToken();
  final response = await http.get(
    Uri.parse(url), 
    headers: {
      'token': 'Bearer $accessToken',
      'refresh-token': '$refreshToken',
    }
  );

  if(response.statusCode == 200){
    return TokenStatus.valid;
  }
  else if(response.statusCode == 403){
    return TokenStatus.accessTokenExpired;
  }
  else if(response.statusCode == 401){
    return TokenStatus.refreshTokenExpired;
  } 
  else if(response.statusCode == 400){
    return TokenStatus.newUser;
  }
  else{
    throw Exception("Failed to check validity");
  }
}

enum TokenStatus {
  valid,
  accessTokenExpired,
  refreshTokenExpired,
  newUser
}