import 'package:flutter/material.dart';
// BU EKRAN İZİN ONAYI VERİLDİGİNDE GELMELİ
class PermissionGrantedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İZİN ONAYI BEKLENİYOR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İzin Verildi!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // İkinci ekrana dönmek icin
              },
              child: Text('Geri Dön'),
            ),
          ],
        ),
      ),
    );
  }
}
