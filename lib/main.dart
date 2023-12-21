import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String loginMessage = '';

  void performLogin(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        loginMessage = 'Harap isi email dan kata sandi.';
      });
    } else {
      if (email == 'adani' && password == 'tes') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        setState(() {
          loginMessage = 'Email atau kata sandi salah.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.0, bottom: 50.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email/Username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Kata Sandi'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                performLogin(context);
              },
              child: Text('Login'),
            ),
            Text(
              loginMessage,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Text('Lupa Kata Sandi'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa Kata Sandi'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Kata Sandi Baru'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Konfirmasi Kata Sandi Baru'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('images/cama.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Adani Saputra',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'NIM: 41822010143',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
