
import 'package:flutter/material.dart';
import 'culinary_model.dart';
import 'culinary_detail_page.dart';
import 'login_page.dart';

class CulinaryListPage extends StatefulWidget {
  const CulinaryListPage({super.key});

  @override
  State<CulinaryListPage> createState() => _CulinaryListPageState();
}

class _CulinaryListPageState extends State<CulinaryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Culinarizz - Kuliner Indonesia'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: culinaryList.length,
        itemBuilder: (context, index) {
          final culinary = culinaryList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  culinary.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 60),
                ),
              ),
              title: Text(culinary.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Kategori: ${culinary.category}\nAsal: ${culinary.origin}"),
              isThreeLine: true,
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CulinaryDetailPage(culinary: culinary),
                  ),
                );
                setState(() {}); 
              },
            ),
          );
        },
      ),
    );
  }
}