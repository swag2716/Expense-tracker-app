class AuthModel{
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String token;
  final String refreshToken;
  final String userId;

  AuthModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.token,
    required this.refreshToken,
    required this.userId,
  });

  factory AuthModel.fromJSON(Map<String, dynamic> json) {
    return AuthModel(
      id: json['ID'], 
      name: json['name'], 
      email: json['email'], 
      phoneNumber: json['phone'], 
      password: '', 
      token: json['token'], 
      refreshToken: json['refresh_token'], 
      userId: json['user_id']
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'ID':id,
      'name':name,
      'email':email,
      'phone':phoneNumber,
      'password':password,
      'token':token,
      'refresh_token':refreshToken,
      'user_id':userId,
    };
  }

}