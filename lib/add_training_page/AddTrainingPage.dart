import 'package:daily_app/trainings/data/entities/Training.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTrainingPage extends StatefulWidget {
  @override
  _AddTrainingPageState createState() => _AddTrainingPageState();
}

class _AddTrainingPageState extends State<AddTrainingPage> {
  final _formKey = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  final List<String> _levels = <String>[
    Level.easy.value,
    Level.medium.value,
    Level.hard.value,
  ];
  String _level = Level.easy.value;

  @override
  void dispose() {
    nameTextController.dispose();
    descriptionTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: nameTextController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.nameHint,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.nameTextFieldHint;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: descriptionTextController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.descriptionHint,
                  ),
                ),
              ),
              DropdownButton<String>(
                value: _level,
                itemHeight: 64.0,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _level = newValue ?? Level.easy.value;
                  });
                },
                items: _levels.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Training training = Training(
                      nameTextController.text,
                      descriptionTextController.text,
                      _level.value,
                    );
                    print(training.toString());
                    Navigator.of(context).pop(training);
                  },
                  child: Text(AppLocalizations.of(context)!.addButtonText),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
