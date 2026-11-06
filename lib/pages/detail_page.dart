import 'package:flutter/material.dart';
import '../models/buku.dart';

class DetailPage extends StatelessWidget {
    final Buku buku;

    const DetailPage({
        super.key,
        required this.buku,
    });

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Detail Buku'),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,

                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),

                    onPressed: () {
                        Navigator.pop(context);
                    },
                ),
            ),

            body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),

                          child: Image.asset(
                            buku.gambar,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                            buku.judul,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                            ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                            'penulis: ${buku.penulis}',
                            style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 10),

                        Text(
                            'penerbit: ${buku.penerbit}',
                            style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 10),

                        Text(
                            'Harga Rp ${buku.harga}',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                            ),
                        ),

                        const SizedBox(height: 25),

                        const Text(
                            'Sinopsis',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                            ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                            buku.sinopsis,
                            style: const TextStyle(
                                fontSize: 16,
                                height: 1.6,
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}