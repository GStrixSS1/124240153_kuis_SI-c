
import 'package:flutter/material.dart';
import 'culinary_model.dart';

class CulinaryDetailPage extends StatefulWidget {
  final Culinary culinary;

  const CulinaryDetailPage({super.key, required this.culinary});

  @override
  State<CulinaryDetailPage> createState() => _CulinaryDetailPageState();
}

class _CulinaryDetailPageState extends State<CulinaryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.culinary.name),
        actions: [
          // Tombol Favorite (Bonus Poin)
          IconButton(
            icon: Icon(
              widget.culinary.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.culinary.isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.culinary.isFavorite = !widget.culinary.isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.culinary.imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.culinary.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(widget.culinary.category),
              backgroundColor: Colors.orange.shade100,
            ),
            const Divider(height: 24),
            _buildInfoRow("Asal Daerah", widget.culinary.origin),
            _buildInfoRow("Bahan Utama", widget.culinary.mainIngredient),
            _buildInfoRow("Cita Rasa", widget.culinary.flavor),
            _buildInfoRow("Tingkat Kepedasan", widget.culinary.spicyLevel),
            _buildInfoRow("Waktu Penyajian", widget.culinary.servingTime),
            const Divider(height: 24),
            const Text(
              "Deskripsi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.culinary.description,
              style: const TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
            ),
          ),
          const Text(": "),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}