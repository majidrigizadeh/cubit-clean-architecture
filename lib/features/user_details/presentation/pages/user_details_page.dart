import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/features/user_details/presentation/cubit/user_details_cubit.dart';
import 'package:test/core/utils/validators.dart';
import 'package:test/features/user_details/presentation/cubit/user_details_state.dart';

class UserDetailsPage extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: BlocConsumer<UserDetailsCubit, UserDetailsState>(
        listener: (context, state) {
          if (state is PhoneNumberSubmitted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Phone number submitted successfully!'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserDetailsError) {
            return Center(child: Text(state.message));
          } else if (state is UserDetailsLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Name: ${state.user.name}'),
                    Text('Email: ${state.user.email}'),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter Iranian phone number',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }
                        if (!Validators.isIranianPhoneNumber(value)) {
                          return 'Invalid Iranian phone number format';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<UserDetailsCubit>().submitPhoneNumber(
                                _phoneController.text.trim(),
                              );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
