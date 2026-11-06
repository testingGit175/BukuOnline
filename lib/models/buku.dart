class Buku {
    final int id;
    final String judul;
    final String penulis;
    final String penerbit;
    final int harga;
    final String sinopsis;
    final String gambar;

    Buku({
        required this.id,
        required this.judul,
        required this.penulis,
        required this.penerbit,
        required this.harga,
        required this.sinopsis,
        required this.gambar,
    });

    factory Buku.fromJson(Map<String, dynamic> json) {
        return Buku(
            id: json['id'],
            judul: json['judul'],
            penulis: json['penulis'],
            penerbit: json['penerbit'],
            harga: json['harga'],
            sinopsis: json['sinopsis'],
            gambar: json['gambar'],
        );
    }
}