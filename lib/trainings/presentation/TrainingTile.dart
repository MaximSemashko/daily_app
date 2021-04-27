import 'package:daily_app/trainings/data/entities/Training.dart';
import 'package:flutter/material.dart';

class TrainingTile extends StatelessWidget {
  final Training? training;

  const TrainingTile({Key? key, this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(training?.title ?? ""),
              subtitle: Text(
                training?.description ?? "",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ));
  }
}
