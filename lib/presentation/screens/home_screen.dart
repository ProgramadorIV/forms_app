import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms App'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Simple state management with cubit'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('BLoC'),
            subtitle: const Text('Simple state managament with bloc'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/counter_bloc'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: const Text('Register User'),
            subtitle: const Text('Register form'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/register'),
          ),
        ],
      ),
    );
  }
}
