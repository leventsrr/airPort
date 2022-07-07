import 'package:air_ports/presentetion/screens/home_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/netCadLogo.jpg',
            height: 100,
          ),
          SizedBox(
            height: 15,
          ),
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('Email')),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_emailController.text == 'test@netcad.com' &&
                        _passwordController.text == 'Ntest!*') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => HomePage(),
                        ),
                      );
                    } else {
                      const snackBar = SnackBar(
                        content: Text('Wrong Email Or Password'),
                      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text('Sign In'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
