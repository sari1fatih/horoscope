import 'package:flutter/material.dart';
import 'utils/strings.dart' as repo;
import 'models/burc.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = List();

    for (var i = 0; i < repo.Strings.BURC_ADLARI.length; i++) {
      burclar.add(Burc(
          repo.Strings.BURC_ADLARI[i],
          repo.Strings.BURC_TARIHLERI[i],
          repo.Strings.BURC_GENEL_OZELLIKLERI[i],
          repo.Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png",
          repo.Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png"));
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirWidget(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirWidget(BuildContext context, int index) {
    Burc current = tumBurclar[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
            /*onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>BurcDetay())),*/
        leading: Image.asset(
          "images/" + current.burcKucukResim,
          height: 64,
          width: 64,
        ),
        title: Text(
          current.burcAdi,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.pink.shade500),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            current.burcTarihi,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black38),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.pink,
        ),
      ),
    ),);
  }
}
