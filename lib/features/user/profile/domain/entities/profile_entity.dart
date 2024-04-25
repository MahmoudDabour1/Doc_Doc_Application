import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
    final  String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? image;
  final String role;

  const ProfileEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.role,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phone,
        image!,
        role,
      ];
}
