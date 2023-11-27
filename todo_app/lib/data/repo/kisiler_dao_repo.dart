import 'package:todo_app/data/entity/kisiler.dart';
import 'package:todo_app/sqlite/veritabani_baglanti.dart';

class KisilerDaoRepository {
  Future<void> Kaydet(String kisi_name) async {
    var baglanti = await VeriTabaniBaglanti.veritabaniErisim();
    
    var yeniKayit = Map<String,dynamic>();
    yeniKayit["name"] = kisi_name;
    
    await baglanti.insert("toDos", yeniKayit);
  }

  Future<void> Guncelle(int kisi_id,String kisi_name) async {
    var baglanti = await VeriTabaniBaglanti.veritabaniErisim();

    var yeniKayit = Map<String,dynamic>();
    yeniKayit["id"] = kisi_id;
    yeniKayit["name"] = kisi_name;

    await baglanti.update("toDos",yeniKayit,where: "id = ?",whereArgs: [kisi_id]);
  }

  Future<List<Kisiler>> KisileriYukle() async {
    var baglanti = await VeriTabaniBaglanti.veritabaniErisim();
    List<Map<String,dynamic>> veriler = await baglanti.rawQuery("SELECT * FROM toDos");

    return List.generate(veriler.length, (index){
      var yeniKayit = veriler[index];
      var kisi_id = yeniKayit["id"];
      var kisi_name = yeniKayit["name"];
      return Kisiler(id: kisi_id, name: kisi_name);
    });
  }

  Future<List<Kisiler>> Ara(String aramaKelimesi) async {
    var baglanti = await VeriTabaniBaglanti.veritabaniErisim();
    List<Map<String,dynamic>> veriler = await baglanti.rawQuery("SELECT * FROM toDos WHERE name like '%$aramaKelimesi%'");

    return List.generate(veriler.length, (index){
      var yeniKayit = veriler[index];
      var kisi_id = yeniKayit["id"];
      var kisi_name = yeniKayit["name"];
      return Kisiler(id: kisi_id, name: kisi_name);
    });
  }

  Future<void> Sil(int kisi_id) async{
    var baglanti = await VeriTabaniBaglanti.veritabaniErisim();
    await baglanti.delete("toDos",where: "id = ?",whereArgs: [kisi_id]);
  }

}