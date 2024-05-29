import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organization_simulation/bloc/auth/auth_bloc.dart';
import 'package:organization_simulation/navigation.dart';
import 'package:organization_simulation/styles.dart';
import 'package:organization_simulation/widgets/widgets.dart';

class AuthScreen extends StatefulWidget {
  static String pageName = 'Authorization menu';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Map<String, String> _roles = {
    'Administrator':'adm',
    'Employee':'emp',
    'FreaLancer':'frl',
  };

  @override
  void initState() {

    super.initState();
    
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthError) {
          _showMessage(state.message);
        } else if (state is AuthSuccessAdmin) {
          Navigation.toManager();
        } else if (state is AuthSuccessEmployee) {
          Navigation.toEmployee();
        } else if (state is AuthLoading) {
          Navigation.toSplash();
        }
      },
      child: Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                height: 40,
                width: 300,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => TextButton(
                  child: Text(
                  '${_roles.keys.elementAt(index)}', 
                  style: TextStyle(color: AppStyles.mainColor)),
                  onPressed: () {
                    setState(() {
                      _loginController.text =_roles.values.elementAt(index);
                    });
                  },
                ),
                separatorBuilder: (context, _) => SizedBox(width: 2),
                itemCount: _roles.length),
                ),
                const SizedBox(height: 12),
                SimpleTextField(
                  labelText: 'Role and name',
                  controller: _loginController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле обязательное для заполнения';
                    } 
                    return null;
                  },
                  //validator: ,
                ),
                const SizedBox(height: 12),
                PasswordField(
                  labelText: 'Password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле обязательное для заполнения';
                    } 
                    return null;
                  },
                 ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 300,
                  child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      onPressed: _onAuthTap,
                      color: AppStyles.mainColor,
                      child: const Text('Войти',
                          style: TextStyle(color: Colors.white, fontSize: 18))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   
   void _showMessage(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(text),
   ));

    void _onAuthTap() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context
      .read<AuthBloc>()
      .add(AuthRun(
        login: _loginController.text, 
        password: _passwordController.text
      ));
    }
  }



}
