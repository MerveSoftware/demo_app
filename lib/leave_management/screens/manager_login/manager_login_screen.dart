import 'package:flutter/material.dart';
import '../manager/manager_screen/manager_dashboard_screen.dart';

class ManagerLoginScreen extends StatefulWidget {
  @override
  _ManagerLoginScreenState createState() => _ManagerLoginScreenState();
}

class _ManagerLoginScreenState extends State<ManagerLoginScreen> {
  // Kullanıcı adı ve şifre kontrolörleri
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Beni hatırla seçeneği su an false halde
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Leave'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Merhaba, Quick Leave\'ye hoş geldiniz!',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Parola',
              ),
              obscureText: true,
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text('Beni Hatırla'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                if (username == 'manager' && password == '123') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>ManagerDashboardScreen(managerName: username),
                    ),
                  );
                } else {
                  // Hatalı giriş
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Hata'),
                      content: Text('Kullanıcı adı veya şifre yanlış!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Tamam'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Giriş Yap'),
            ),

          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ManagerLoginScreen(),
    routes: {
      '/home': (context) => HomeScreen(),
    },
  ));
}

// Örnek ana ekran
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Ekran'),
      ),
      body: Center(
        child: Text('Ana Ekran'),
      ),
    );
  }
}
