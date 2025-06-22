import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vocab_provider.dart';
import '../widgets/vocab_item.dart';
import '../widgets/add_word_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VocabProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocab Learner'),
        actions: [
          IconButton(
            icon: Icon(provider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              provider.toggleTheme();
              provider.saveWords();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: provider.words.length,
        itemBuilder: (context, index) => VocabItem(index: index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (ctx) => const AddWordDialog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}