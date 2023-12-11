import 'package:new_crypto_app/models/coin_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CoinController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Coin> coinsList = <Coin>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
  }

  fetchCoins() async {
    List<Coin> coins = [];
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d&locale=en'));

      coins = coinFromJson(response.body);
      coinsList.value = coins;
    } finally {
      isLoading(false);
    }
  }
}
