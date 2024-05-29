import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/blocs.dart';

class NewCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BlocApp"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<NewCounterBloc, NewCounterState>(
          builder: (context, state) {
            Widget body = Container();
            if (state is NewCounterInitial) {
              body = Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: double.maxFinite),
                  Text(
                    "${state.value}",
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => context
                              .read<NewCounterBloc>()
                              .add(NewCounterIncrement(weight: 5))),
                      IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => context
                              .read<NewCounterBloc>()
                              .add(NewCounterDecrement(weight: 5))),
                    ],
                  )
                ],
              );
            } else if (state is NewCounterLoading) {
              body = Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: double.maxFinite),
                  CircularProgressIndicator()
                ],
              );
            }
            return body;
          },
        ),
      ),
    );
  }
}
