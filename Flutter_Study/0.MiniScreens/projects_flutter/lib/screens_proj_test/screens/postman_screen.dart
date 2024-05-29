import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/screens_proj_test/postman/bloc/postman_bloc.dart';

class PostManScreen extends StatefulWidget {
 

  @override
  _PostManScreenState createState() => _PostManScreenState();
}

class _PostManScreenState extends State<PostManScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<PostmanBloc,PostmanState>(
              listener: (context, state){
                if(state is PostsInitError)
                Center(child: Text('ERROR'));
              },
              builder: (context, state) {
               Widget body = Container();
              if(state is PostmanLoaded)
              body = Text('${state.posts.map}');
              return body;
              }
              )
              
            )
          ],
        ),
      ),
    );
  }
}