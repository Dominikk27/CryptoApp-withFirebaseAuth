import 'package:flutter/material.dart';
import 'package:new_crypto_app/Widgets/card.dart';
import 'package:new_crypto_app/Widgets/navbar.dart';
import 'package:get/get.dart';

import 'package:new_crypto_app/models/coin_controller.dart';

class CoinListView extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  CoinListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.coinsList.isEmpty
                ? Center(
                    child: Text(
                      'Žiadne kryptomeny sa nenašli. Skontrolujte pripojenie k internetu.',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.coinsList.length,
                    itemBuilder: ((context, index) {
                      return CoinCard(
                        coinImage: controller.coinsList[index].image,
                        coinName: controller.coinsList[index].name,
                        coinValue: controller.coinsList[index].currentPrice
                            .toStringAsFixed(2),
                        OneHour: controller
                            .coinsList[index].priceChangePercentage1HInCurrency
                            .toStringAsFixed(2),
                        OneDay: controller
                            .coinsList[index].priceChangePercentage24HInCurrency
                            .toStringAsFixed(2),
                        SevenD: controller
                            .coinsList[index].priceChangePercentage7DInCurrency
                            .toStringAsFixed(2),
                        index: index,
                      );
                    }),
                    padding: EdgeInsets.only(bottom: 50.0),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.fetchCoins();
        },
        child: Icon(Icons.refresh),
        backgroundColor: Color.fromARGB(255, 54, 243, 33),
      ),
    );
  }
}
