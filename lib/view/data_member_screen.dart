import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataMemberScreen extends StatefulWidget {
  const DataMemberScreen({super.key});

  @override
  State<DataMemberScreen> createState() => DataMemberScreenState();
}

class DataMemberScreenState extends State<DataMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('DataMemberScreen'),
      ),
    );
  }
}
