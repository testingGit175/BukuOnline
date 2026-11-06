
import 'package:flutter/material.dart';
import '../models/buku.dart';
import '../services/buku_services.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toko Buku Cahaya Ilmu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: FutureBuilder<List<Buku>>(
        future: BukuService.loadBuku(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Gagal membaca data buku'),
            );
          }

          final bukuList = snapshot.data ?? [];

          if (bukuList.isEmpty) {
            return const Center(
              child: Text('Belum ada buku'),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),

            itemCount: bukuList.length,

            itemBuilder: (context, index) {
              final buku = bukuList[index];

              return Card(
                elevation: 3,
                clipBehavior: Clip.antiAlias,

                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          buku: buku,
                        ),
                      ),
                    );
                  },

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                        height: 125,
                        width: double.infinity,
                        color: Colors.blue.shade100,

                        child: const Icon(
                          Icons.menu_book,
                          size: 45,
                          color: Colors.blue,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              buku.judul,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Rp ${buku.harga}',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            const Text(
                              'Lihat Detail',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),

                            child: Image.asset(
                              buku.gambar,
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
