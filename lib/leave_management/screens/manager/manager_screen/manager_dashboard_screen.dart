import 'package:flutter/material.dart';

class ManagerDashboardScreen extends StatelessWidget {
  final String managerName;

  const ManagerDashboardScreen({Key? key, required this.managerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoşgeldin, $managerName'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 16.0, 5.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Ayarlar ekranına gitmek için navigasyon
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    // Profil için navigasyon
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
                      // İzinleri yönetmek için izinler ekranına gidecek
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                    child: Text('İzinleri Yönet'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Vardiyaları görmek için vardiyalar ekranına git nav
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                    child: Text('Vardiyaları Gör'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // İşçilerin izin taleplerini görüntülemek için izin talepleri ekranına git nv
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                    child: Text('İzin Talepleri'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Çıkış işlemi iin nav
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
