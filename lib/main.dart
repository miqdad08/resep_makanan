import 'package:resep_makanan/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:resep_makanan/DetailPage.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Nama Makanan'),
      ),
      body: _PageList(),
    );
  }
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');
final bigHeaderTextStyle =
baseTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold);
final descTextStyle =
baseTextStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w400);
final footerTextStyle =
baseTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w400);

class _PageList extends StatefulWidget {
  @override
  __PageStateListState createState() => __PageStateListState();
}

class __PageStateListState extends State<_PageList> {


  List<String> bahan =[
    "Nasi\n Bawang Merah\n Bawang Bombat\n Bawang Putih\n Cabe Halus\n Telor\n Kecap\n Garam"
    "1 ekor ayam kampung segar ukuran sedang\n 3 batang serai yang dimemarkan\n 5 lembar daun salam\n 5 lembar daun salam\n 1 ruas jari orang dewasa lengkuas yang dimemarkan\n 1 sdm gula pasir\n 2 1/2 sdm garam\n 3,5 liter air bersih secukupnya\n Minyak secukupnya untuk menumis bumbu halus"
    "Garam\n Lada\n Daun bawang\n Jahe\n Kunyit\n Lengkuas\n Daging Sapi"
    "Daging sapi\n Santan\n Lenkuas\n Jahe\n Kunyit\n Ketumbar\n Kemiri\n Bawang Merah/putih \n Cabe"
    "Telor\n Garem\n Bawng putih\n bawang Merah\n Daun Bawang"
    "1 ekor ayam kampung muda, potong jadi 4 bagian \n 7 butir bawang merah\n 7 buah cabai merah atau cabai keriting"
    "- 600 gr ubi ungu kukus\n - 150 gr tepung ketan\n - 1/2 sdt garam \n - 50 ml air \n - 150 gr gula merah \n - 3 lembar daun pandan \n - 250 gr kelapa parut kukus"
    "1 kg daging ayam tanpa tulang, digiling\n 1 butir telur ayam\n 4 siung bawang putih, haluskan \n 50 gr tepung kanji/sagu \n 40 gr es batu, hancurkan \n 2 sdt merica bubuk \n 1 sdt garam \n 2 sdm bawang merah goreng \n 2 liter air \n"
    "- Mie telur, rebus hingga matang\n Daging Ayam\n "


  ];
  List<String> cara =[
    ""
  ];


  List<String> judul = [
    "Nasi Goreng",
    "Soto Lamongan",
    "Soto Babat",
    "Rendang",
    "Dadar",
    "Pecel",
    "Klepon",
    "Bakso",
    "Mie Ayam",
    "Sate Padang"
  ];
  List<String> subJudul = [
    ".....",
    ".....",
    ".....",
    ".....",
    ".....",
    ".....",
    ".....",
    ".....",
    ".....",
    "....."

  ];
  List<String> gambar = [
    "assets/images/nasigoreng.jpg",
    "assets/images/sotolamo.jpg",
    "assets/images/sotobabat.jpg",
    "assets/images/rendang.jpg",
    "assets/images/dadar.jpg",
    "assets/images/pecel.jpeg",
    "assets/images/klepon.jpg",
    "assets/images/bakso.jpg",
    "assets/images/mieayam.jpg",
    "assets/images/sate.jpg"

  ];
  List<String> jmlh = [
    "30",
    "30",
    "50",
    "20",
    "20",
    "50",
    "35",
    "27",
    "45",
    "10"
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: judul.length,
        itemBuilder: (BuildContext context, int index) {
          final title = judul[index].toString();
          final subTitle = subJudul[index].toString();
          final jumlah = jmlh[index].toString();
          final img = gambar[index].toString();
          final bhn = bahan[index].toString();
          final cra = cara[index].toString();
          return Container(
            height: 200.0,
            padding: EdgeInsets.only(left: 8.0, top: 8.0),
            child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    backgroundImage(img),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: topContent(title, subTitle, jumlah),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetailPage(itemJudul: title,
                              itemSub: subTitle, qty: jumlah, itemImage: img)
                  ));
                }
            ),
          );
        },
      ),
    );
  }

  backgroundImage(String gambar) {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.luminosity),
              image: AssetImage(gambar))),
    );
  }

  topContent(String nama, String deksripsi, String stok) {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderTextStyle,
          ),
          Text(
            deksripsi,
            style: descTextStyle, textAlign: TextAlign.left,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.blue,
          ),
          Text(
            stok,
            style: footerTextStyle,
          ),
        ],
      ),
    );
  }
}