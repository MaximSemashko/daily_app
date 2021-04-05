import 'package:daily_app/trainings/data/entities/Training.dart';
import 'package:daily_app/trainings/presentation/TrainingTile.dart';
import 'package:flutter/material.dart';

class TrainingsPage extends StatelessWidget {
  Training _training =
      Training("123", "", "Title", "description", Level.hard, ["1", "2"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainings'),
      ),
      body: ListView(
        children: [
          TrainingTile(training: _training),
          TrainingTile(training: _training)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
