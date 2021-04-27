import 'package:daily_app/add_training_page/AddTrainingPage.dart';
import 'package:daily_app/trainings/data/entities/Training.dart';
import 'package:daily_app/trainings/presentation/TrainingTile.dart';
import 'package:flutter/material.dart';

class TrainingsPage extends StatefulWidget {
  @override
  _TrainingsPageState createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  List _trainings = [
    Training("Title", "Description", Level.medium),
    Training("Title", "Description", Level.medium)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainings'),
      ),
      body: ListView.builder(
          itemCount: _trainings.length,
          itemBuilder: (BuildContext context, int position) {
            return TrainingTile(training: _trainings[position]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/addTraining');
          _openAddTrainingPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future _openAddTrainingPage() async {
    final training =
        await Navigator.of(context).push(new MaterialPageRoute<Training>(
                builder: (BuildContext context) {
                  return new AddTrainingPage();
                },
                fullscreenDialog: true)) ??
            null;

    setState(() {
      if (training != null) {
        _trainings.add(training);
      }
    });
  }
}
