import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/title_provider.dart';

class EditTitleScreen extends StatelessWidget {
  const EditTitleScreen({super.key});

  static const path = '/edit-title-screen';

  @override
  Widget build(BuildContext context) {
    String editedTitle = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Title'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16).copyWith(bottom: 0),
        children: [
          TextFormField(
            initialValue: context.read<TitleProvider>().title,
            onChanged: (value) => editedTitle = value,
            decoration: const InputDecoration(
              label: Text('Title'),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              context.read<TitleProvider>().title = editedTitle;
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
