class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? photoThumbnail;
  String? photo = "login-logo.png";
  String? photoPath = "assets/logos/";
  String? verified;
  String? gender;
  String? userType;
  String? profileStatus;
  String? examStatus;
  String? assignStatus;
  String? status;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.verified,
      this.gender,
      this.profileStatus,
      this.status,
      this.createdAt,
      this.updatedAt}); // now create converter

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      id: responseData['id'],
      firstName: responseData['first_name'],
      lastName: responseData['last_name'],
      email: responseData['email'],
      phone: responseData['mobile_number'],
      gender: responseData['gender'],
      verified: responseData['verified'],
      profileStatus: responseData['profile_status'],
      status: responseData['status'],
      createdAt: responseData['created_at'],
      updatedAt: responseData['updated_at'],
    );
  }
  Map toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile_number": phone,
        "gender": gender,
        "verified": verified,
        "profile_status": profileStatus,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
