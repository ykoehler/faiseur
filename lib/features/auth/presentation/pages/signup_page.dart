import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sign up page widget.
class SignupPage extends ConsumerWidget {
  /// Creates a signup page.
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person_add, size: 64),
              const SizedBox(height: 16),
              const Text('Sign Up Page'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement sign up
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('TODO: Implement sign up')),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      );
}
