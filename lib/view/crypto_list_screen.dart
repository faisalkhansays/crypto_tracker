import 'package:crypto_tracker/view_model/crypto_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CryptoViewModel>(context, listen: false).fetchCryptos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Tracker'),
        centerTitle: true,
      ),
      body: Consumer<CryptoViewModel>(builder: (context, provider, child) {
        if (provider.loading){
          return Center(child: CircularProgressIndicator());

        }else if(provider.errorMessage !=null){
          return Center(child: Text(provider.errorMessage!));
        }else{
          return ListView.builder(
              itemCount: provider.cryptos.length,
              itemBuilder: (context, index) {
            final crypto=provider.cryptos[index];
            return ListTile(
              title: Text(crypto.name),
              leading: Image.network(crypto.image),
              subtitle: Text(crypto.symbol),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(crypto.price.toString())],
              ),
            );
          });
        }
      },),
    );
  }
}
