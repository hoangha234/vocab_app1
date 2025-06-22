import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vocab_provider.dart';

class VocabItem extends StatelessWidget {
  final int index;
  const VocabItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VocabProvider>(context);
    final word = provider.words[index];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(word.word, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(word.meaning),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () => provider.deleteWord(index),
        ),
      ),
    );
  }
}