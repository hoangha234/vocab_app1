import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vocab_provider.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final _wordController = TextEditingController();
  final _meaningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Word'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _wordController,
            decoration: const InputDecoration(labelText: 'English Word'),
          ),
          TextField(
            controller: _meaningController,
            decoration: const InputDecoration(labelText: 'Meaning (VN)'),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: () {
            if (_wordController.text.isNotEmpty && _meaningController.text.isNotEmpty) {
              Provider.of<VocabProvider>(context, listen: false).addWord(
                _wordController.text.trim(),
                _meaningController.text.trim(),
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}