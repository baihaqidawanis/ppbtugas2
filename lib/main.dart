import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ArsenalApp());
}

class ArsenalApp extends StatelessWidget {
  const ArsenalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arsenal FC App',
      theme: ThemeData(
        useMaterial3: true,
        // 1. Integrasi Google Fonts (Poppins) agar tidak default
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const ArsenalHomePage(),
    );
  }
}

class ArsenalHomePage extends StatefulWidget {
  const ArsenalHomePage({super.key});

  @override
  State<ArsenalHomePage> createState() => _ArsenalHomePageState();
}

class _ArsenalHomePageState extends State<ArsenalHomePage> {
  // 2. State Management (Stateful)
  int _trophyCount = 13;

  void _incrementTrophies() {
    setState(() {
      _trophyCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 3. AppBar & Colors (Lanjutan Tugas 1)
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFCD00), // Warna Emas Arsenal
        title: Text(
          'Arsenal FC App',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 4. Image Widget (Assets)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Image.asset(
                'asset/Arsenal_FC.png',
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            // 5. Container & Colors (Red Banner)
            Container(
              width: double.infinity,
              color: const Color(0xFFEF0107), // Merah Arsenal
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'COYG! Can we win the Premier League title this season?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 6. Rows & Icons (Features)
            Container(
              color: const Color(0xFFFFCD00),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeatureItem(icon: Icons.stadium, label: 'Emirates'),
                  FeatureItem(icon: Icons.confirmation_number, label: 'Tickets'),
                  FeatureItem(icon: Icons.shopping_bag, label: 'Store'),
                ],
              ),
            ),

            // 7. Stateful Counter Section (Interaksi)
            Container(
              color: const Color(0xFF063672), // Biru Arsenal
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Premier League Titles: $_trophyCount',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Tombol Tambah (Kombinasi Container & InkWell)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _incrementTrophies,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF0107),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // 8. FloatingActionButton (Opsional, dari Tugas 1)
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementTrophies,
        backgroundColor: const Color(0xFFEF0107),
        child: const Icon(Icons.plus_one, color: Colors.white),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 35, color: const Color(0xFF063672)),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
