class VocabWord {
  final String word;
  final String meaning;

  VocabWord({required this.word, required this.meaning});

  Map<String, String> toMap() => {'word': word, 'meaning': meaning};

  factory VocabWord.fromMap(Map<String, dynamic> map) => VocabWord(
    word: map['word'],
    meaning: map['meaning'],
  );
}