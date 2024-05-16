import 'package:adv_basics/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/answer_button.dart';
import '/data/questions.dart';
import 'core_state.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(context) {
    return MyScaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Consumer<CoreState>(
            builder: (_, state, __) {
              final currentQuestion = questions[state.currentQuestionIndex];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentQuestion.text,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 201, 153, 251),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ...currentQuestion.shuffledAnswers.map((answer) {
                    return AnswerButton(
                      answerText: answer,
                      onTap: () {
                        state.chooseAnswer(context, answer);
                      },
                    );
                  })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
