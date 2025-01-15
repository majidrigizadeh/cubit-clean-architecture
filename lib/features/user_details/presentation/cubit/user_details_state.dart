import 'package:flutter/material.dart';
import 'package:test/features/user_details/domain/entities/user.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final User user;

  UserDetailsLoaded({required this.user});
}

class UserDetailsError extends UserDetailsState {
  final String message;

  UserDetailsError({required this.message});
}

class PhoneNumberSubmitted extends UserDetailsState {}