import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission_service.dart';
import 'status_saver_service.dart';

class StatusSaverPage extends StatelessWidget {
  const StatusSaverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contextual Action Bar Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      // for Scaffold.of(context)

     home: Scaffold(
       body: StreamBuilder<PermissionStatus>(
           stream: (StoragePermissionService()..requestPermission()).storagePermission,
           builder: (context, snapshot) {
             if (snapshot.hasData && snapshot.data!.isGranted) {
               return StatusSaverService();
             }
             return Container(
               alignment: FractionalOffset.center,
               child: const CircularProgressIndicator(),
             );
           }),
     )
    );
  }
}
