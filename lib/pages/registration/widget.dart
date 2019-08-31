import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_double/assebmly/registration/firebase_auth_view_model_factory.dart';
import 'package:social_double/pages/registration/view_model.dart';

class RegistrationWidget extends StatefulWidget {
  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegistrationViewModel _viewModel =
      RegistrationViewModelFactory().create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    return StreamBuilder<RegistrationState>(
      stream: _viewModel.stateStream,
      builder:
          (BuildContext context, AsyncSnapshot<RegistrationState> snapshot) {
        if (snapshot.hasData) {
          return _buildBasedOnState(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildBasedOnState(RegistrationState data) {
    switch (data.status) {
      case Status.idle:
        return _buildRegistrationPage();
      case Status.error:
        Future.delayed(
            const Duration(),
            () => _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Error occurred: ${data.error.toString()}"),
            )));
        return _buildRegistrationPage();
      case Status.inProgress:
        return Center(child: CircularProgressIndicator());
      case Status.registered:
        Future.delayed(const Duration(),
            () => Navigator.of(context).pushReplacementNamed("/"));
        return _buildRegistrationPage();
      default:
        throw ArgumentError();
    }
  }

  Widget _buildRegistrationPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(hintText: 'E-mail'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('Register'),
                onPressed: () => _viewModel.register(
                    _emailController.text, _passwordController.text),
              ),
            ],
          )
        ],
      ),
    );
  }
}
