import 'package:daily_app/trainings/presentation/TrainingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _children = [TrainingsPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: AppLocalizations.of(context)!.trainings,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              label: 'Challenges',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title:
                new Text(AppLocalizations.of(context)!.logoutAlertDialogTitle),
            content: new Text(
                AppLocalizations.of(context)!.logoutAlertDialogContent),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(AppLocalizations.of(context)!
                    .logoutAlertDialogNegativeButton),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text(AppLocalizations.of(context)!
                    .logoutAlertDialogPositiveButton),
              ),
            ],
          ),
        )) ??
        false;
  }
}
