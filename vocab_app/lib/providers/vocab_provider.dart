import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/vocab_word.dart';

class VocabProvider extends ChangeNotifier {
  List<VocabWord> _words = [];
  bool _isDarkMode = false;

  List<VocabWord> get words => _words;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  Future<void> loadWords() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('words');
    if (data != null) {
      final decoded = json.decode(data) as List;
      _words = decoded.map((e) => VocabWord.fromMap(e)).toList();
    }
    _isDarkMode = prefs.getBool('darkMode') ?? false;
    notifyListeners();
  }

  Future<void> saveWords() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = json.encode(_words.map((e) => e.toMap()).toList());
    await prefs.setString('words', encoded);
    await prefs.setBool('darkMode', _isDarkMode);
  }

  void addWord(String word, String meaning) {
    _words.add(VocabWord(word: word, meaning: meaning));
    saveWords();
    notifyListeners();
  }

  void deleteWord(int index) {
    _words.removeAt(index);
    saveWords();
    notifyListeners();
  }
}