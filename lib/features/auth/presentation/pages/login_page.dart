import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sign in page widget.
class LoginPage extends ConsumerWidget {
  /// Creates a login page.
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Sign In')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.login, size: 64),
          const SizedBox(height: 16),
          const Text('Login Page'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement sign in
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('TODO: Implement sign in')));
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    ),
  );
}
