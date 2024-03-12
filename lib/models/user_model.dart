class User {

  String id;
  String email;
  String lastName;
  String firstName;
  String username;
  String password;
  String phoneNumber;
  String ProfilePicture;
  User({

    required this.id,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.ProfilePicture,
  });

  // Factory method to create a User instance from a map (e.g., when getting data from a database)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(

      email: map['email'] ?? '',
      lastName: map['lastName'] ?? '',
      firstName: map['firstName'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      id: map['id'] ?? '',
      ProfilePicture: map['ProfilePicture'] ?? '',
    );
  }

  // Convert the User instance to a map (e.g., for saving to a database)
  Map<String, dynamic> toJson() {
    return {

      'profilePicture': ProfilePicture,
      'email': email,
      'lastName': lastName,
      'firstName': firstName,
      'username': username,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }
}
