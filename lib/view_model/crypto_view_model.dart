import 'package:crypto_tracker/model/crypto_model.dart';
import 'package:crypto_tracker/services/api_services.dart';
import 'package:flutter/cupertino.dart';

class CryptoViewModel extends ChangeNotifier {
  List<CryptoModel> _cryptos = [];
  bool _loading = false;
  String? _errorMessage;

  List<CryptoModel> get cryptos => _cryptos;

  bool get loading => _loading;

  String? get errorMessage => _errorMessage;
  Future<void> fetchCryptos()async {
    _loading=true;
    notifyListeners();
    try{
      _cryptos=await ApiServices().fetchCryptos();

      _errorMessage=null;

    }catch (e){
      _errorMessage="Error:$e";
    }
    finally {
      _loading = false;
      notifyListeners();
    }

  }
}
