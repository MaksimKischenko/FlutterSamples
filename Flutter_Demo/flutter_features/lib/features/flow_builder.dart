import 'dart:developer';

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyMainApp());
}

class MyMainApp extends StatelessWidget {
  const MyMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyFlow(),
    );
  }
}

class Profile {
  const Profile({this.name, this.age, this.weight});

  final String? name;
  final int? age;
  final int? weight;

  Profile copyWith({String? name, int? age, int? weight}) {
    return Profile(
      name: name ?? this.name,
      age: age ?? this.age,
      weight: weight ?? this.weight,
    );
  }
}

class NameForm extends StatefulWidget {
  const NameForm({super.key});

  @override
  _NameFormState createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  var _name = '';

  void _continuePressed() {
    context.flow<Profile>().update((profile) => profile.copyWith(name: _name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Name')),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) => setState(() => _name = value),
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'John Doe',
              ),
            ),
            MaterialButton(
              onPressed: _name.isNotEmpty ? _continuePressed : null,
              child: const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}

class AgeForm extends StatefulWidget {
  const AgeForm({super.key});

  @override
  _AgeFormState createState() => _AgeFormState();
}

class _AgeFormState extends State<AgeForm> {
  int? _age;

  void _continuePressed() {
    context.flow<Profile>().complete((profile) => profile.copyWith(age: _age));
  }

  @override
  Widget build(BuildContext context) {
    log('PRODILE: ${context.flow<Profile>().state.name}');
    return Scaffold(
      appBar: AppBar(title: const Text('Age')),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) => setState(() => _age = int.parse(value)),
              decoration: const InputDecoration(
                labelText: 'Age',
                hintText: '42',
              ),
              keyboardType: TextInputType.number,
            ),
            MaterialButton(
              onPressed: _age != null ? _continuePressed : null,
              child: const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}

class MyFlow extends StatefulWidget {
  const MyFlow({super.key});

  @override
  State<MyFlow> createState() => _MyFlowState();
}

class _MyFlowState extends State<MyFlow> {
  late FlowController<Profile> _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlowController(const Profile(
      name: 'START',
      age: 0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<Profile>(
      state: const Profile(),
      onGeneratePages: (profile, pages) {
        return [
          const MaterialPage(child: NameForm()),
          if (profile.name != null) const MaterialPage(child: AgeForm()),
        ];
      },
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
