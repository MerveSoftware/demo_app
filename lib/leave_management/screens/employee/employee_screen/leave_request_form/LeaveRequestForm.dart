import 'package:flutter/material.dart';

import 'PermissionGrantedScreen.dart';

class LeaveRequestForm extends StatefulWidget {
  @override
  _LeaveRequestFormState createState() => _LeaveRequestFormState();
}

class _LeaveRequestFormState extends State<LeaveRequestForm> {
  String _selectedReason = 'Yıllık İzin';
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _additionalReasonController = TextEditingController();
  final List<String> _reasons = ['Yıllık İzin', 'Haftalık İzin', 'Diğer'];//farkli izin eklenebilir

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İzin Talebi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'İzin Almak İçin Gerekçe Belirtin:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _reasonController,
              decoration: InputDecoration(
                hintText: 'İzin talebinizin nedenini belirtin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _additionalReasonController,
              decoration: InputDecoration(
                hintText: 'Ek gerekçe (isteğe bağlı)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'İzin Türünü Seçin:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: _selectedReason,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedReason = newValue!;
                });
              },
              items: _reasons.map((reason) {
                return DropdownMenuItem(
                  value: reason,
                  child: Text(reason),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'İzin Başlangıç Tarihini Seçin:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('Tarih Seç'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // İzin talebini göndermek için
                _sendLeaveRequest();
              },
              child: Text('İzin Talebini Gönder'),
            ),


          ],

        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  void _sendLeaveRequest() {
    // İzin talebi gönderildiğinde bildirim göstericek
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Bildirim'),
        content: Text('İzin talebiniz gönderildi. Onay bekleniyor.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PermissionGrantedScreen()),
              );
             },
            child: Text('Tamam'),
          ),
        ],
      ),
    );
  }
}
