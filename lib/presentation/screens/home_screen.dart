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
            subtitle: const Text('Simple state management'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/cubits'),
          )
        ],
      ),
    );
  }
}
