import 'package:flutter/material.dart';
import 'leave_request_form/LeaveRequestForm.dart';

class WorkerDashboardScreen extends StatelessWidget {
  final String workerName;

  const WorkerDashboardScreen({Key? key, required this.workerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoşgeldin, $workerName'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.1, 16.0, 0.1, 16.0),
            //KONUM AYARLAMA YAPILACAK
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Ayarlar ekranına gitmek için navigasyon push
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    // Profil ekranına gitmek için navigasyon PUSH
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LeaveRequestForm()),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                    child: Text('izinler'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Vardiyalar ekranına gitmek için navigasyon push
                    },

                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                    child: Text('Vardiyalar'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Molalar navigasyon
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                    child: Text('Molalar'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Çıkış işlemi icin
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                    child: Text('Çıkış'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
