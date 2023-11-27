import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/kisiler_dao_repo.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit():super(0);
  var krepo = KisilerDaoRepository();

  Future<void> kaydet(String kisi_name) async {
    await krepo.Kaydet(kisi_name);
  }
}