import 'dart:math';

const List sample_data = [
  {
    "id": 1,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];
List<Map<String, dynamic>> shuffleQuestionsAndOptions(List<Map<String, dynamic>> questions) {
  Random random = Random();

  // Trộn ngẫu nhiên danh sách câu hỏi
  List<Map<String, dynamic>> shuffledQuestions = List.from(questions)..shuffle(random);

  // Trộn ngẫu nhiên danh sách đáp án cho mỗi câu hỏi
  for (var question in shuffledQuestions) {
    question['options'].shuffle(random);
  }

  return shuffledQuestions;
}