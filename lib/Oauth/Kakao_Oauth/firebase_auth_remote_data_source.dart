import 'package:http/http.dart' as http;

class FirebaseAuthRemoteDataSource {
  //firebase hostinh function url
  final String url = 'https://us-central1-hang-c1561.cloudfunctions.net/createCustomToken';

  Future<String> createCustomToken(Map<String, dynamic> user) async {
    print("customTokenResponse1");
    final customTokenResponse = await http
        .post(Uri.parse(url), body: user);
    print(customTokenResponse.body);
    print(customTokenResponse.bodyBytes);
    print(customTokenResponse.statusCode);
    print("customTokenResponse2");

    return customTokenResponse.body;
  }
}