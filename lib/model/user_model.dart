class UserModel{
  final String? uid;
  final String? email;
  final String? phoneNo;
  final String? password;

  UserModel({
    this.uid,
    this.email,
    this.phoneNo,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "uid":uid,
      "email":email,
      "phoneno":phoneNo,
      "password":password,
    };
  }
}