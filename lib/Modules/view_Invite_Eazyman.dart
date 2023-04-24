import 'package:flutter/material.dart';
import 'package:get/get.dart';

class inviteEazyan extends StatelessWidget {
  const inviteEazyan({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('invite Eazyman'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Invite your friends to be an Eazyman'),
              ElevatedButton(onPressed: (){}, child: Text('Invite Friends'))
            ],
          ),
        ),
      );
    }
  }

