import 'package:daily_app/trainings/data/entities/Training.dart';
import 'package:flutter/material.dart';

class TrainingTile extends StatelessWidget {
  final Training training;

  const TrainingTile({Key key, this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              // leading: Image.asset(training.imageUrl),
              title: Text(training.title),
              subtitle: Text(
                training.description,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                Chip(
                  avatar: Icon(Icons.local_fire_department),
                  label: Text('Medium'),
                ),
                Chip(
                  label: Text('back'),
                ),
                Chip(
                  label: Text('biceps'),
                ),
                Chip(
                  label: Text('abs'),
                ),
              ],
            ),
          ],
        ));
  }

// dynamicChips() {
//   final Attribute attributes = training.attributes;
//   return Wrap(
//     spacing: 8.0,
//     runSpacing: 4.0,
//     children: List<Widget>.generate(attributes.length, (int index) {
//       return Chip(
//           avatar: if (training.attributes) Icon(Icons.local_fire_department),
//           label: Text(training.attributes.),
//       );
//     }),
//   );
// }
}
