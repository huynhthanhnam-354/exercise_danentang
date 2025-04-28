import 'package:flutter/material.dart';

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({Key? key}) : super(key: key);

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Thủ đô của Việt Nam là?',
      'answers': ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng'],
      'correct': 'Hà Nội',
    },
    {
      'question': '2 + 2 = ?',
      'answers': ['3', '4', '5'],
      'correct': '4',
    },
    {
      'question': 'Màu của bầu trời là gì?',
      'answers': ['Xanh', 'Đỏ', 'Vàng'],
      'correct': 'Xanh',
    },
    {
      'question': 'Động vật nào được gọi là "chúa sơn lâm"?',
      'answers': ['Sư tử', 'Hổ', 'Báo'],
      'correct': 'Hổ',
    },
    {
      'question': 'Ai là người sáng lập Microsoft?',
      'answers': ['Steve Jobs', 'Elon Musk', 'Bill Gates'],
      'correct': 'Bill Gates',
    },
    {
      'question': 'Sông nào dài nhất thế giới?',
      'answers': ['Amazon', 'Nile', 'Mississippi'],
      'correct': 'Nile',
    },
    {
      'question': 'Quốc gia nào có diện tích lớn nhất thế giới?',
      'answers': ['Nga', 'Mỹ', 'Canada'],
      'correct': 'Nga',
    },
    {
      'question': 'Môn thể thao vua là?',
      'answers': ['Bóng đá', 'Bóng rổ', 'Quần vợt'],
      'correct': 'Bóng đá',
    },
    {
      'question': 'Trong bảng tuần hoàn hóa học, ký hiệu của nước là gì?',
      'answers': ['O2', 'H2O', 'CO2'],
      'correct': 'H2O',
    },
    {
      'question': 'Loài chim nào có thể bay lùi?',
      'answers': ['Chim bồ câu', 'Chim sẻ', 'Chim ruồi'],
      'correct': 'Chim ruồi',
    },
  ];

  void checkAnswer(String userAnswer) {
    String correctAnswer = questions[questionNumber]['correct'];

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (questionNumber < questions.length - 1) {
        questionNumber++;
      } else {
        // Reset quiz
        questionNumber = 0;
        scoreKeeper.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Quizzler'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questions[questionNumber]['question'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              ...(questions[questionNumber]['answers'] as List<String>).map((answer) =>
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        answer,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(answer);
                      },
                    ),
                  ),
                ),
              ).toList(),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}