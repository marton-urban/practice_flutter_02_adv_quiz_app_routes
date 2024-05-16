import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'summary_item.dart';
import '../core_state.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: context.read<CoreState>().summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
