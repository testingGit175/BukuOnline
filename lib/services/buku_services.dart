import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/buku.dart';

class BukuService {
    static Future<List<Buku>> loadBuku() async {
        final String response = await rootBundle.loadString(
            'assets/data/buku.json',
        );

        final List data = json.decode(response);

        return data.map((item) => Buku.fromJson(item)).toList(); 
    }
}