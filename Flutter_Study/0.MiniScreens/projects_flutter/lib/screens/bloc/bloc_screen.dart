import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget {
  final bloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, int>(
      bloc: bloc,
      listener: (context, state) {
        if (state == 5) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Five')));
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, int>(
              bloc: bloc,
              buildWhen: (previous, current) {
                if (current == 5) return false;
                return true;
              },
              builder: (context, state) {
                return Center(child: Text("$state"));
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.add(CounterIncrement());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(event) async* {
    if (event is CounterIncrement) {
      yield state + 1;
    }
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  void onEvent(CounterEvent event) {
    print(event);
    super.onEvent(event);
  }
}

class CounterEvent {}

class CounterIncrement extends CounterEvent {}
