import 'package:flutter/material.dart';
import 'package:new_crypto_app/Widgets/navbar.dart';
import 'package:get/get.dart';

import 'package:new_crypto_app/models/coin_controller.dart';

class CoinScreen extends StatelessWidget {
  final int index;

  CoinScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoinController controller = Get.find<CoinController>();

    String OneHour = controller
        .coinsList[index].priceChangePercentage1HInCurrency
        .toStringAsFixed(2);
    String OneDay = controller
        .coinsList[index].priceChangePercentage24HInCurrency
        .toStringAsFixed(2);
    String SevenD = controller
        .coinsList[index].priceChangePercentage7DInCurrency
        .toStringAsFixed(2);

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        title: Center(
          child: Text(
            '#${controller.coinsList[index].marketCapRank} ${controller.coinsList[index].name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF2C2C2C),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: Image.network(controller.coinsList[index].image),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // 1 Hour
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  '1h',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      (OneHour.contains("-"))
                                          ? Icons.arrow_drop_down_rounded
                                          : Icons.arrow_drop_up_rounded,
                                      color: (OneHour.contains("-"))
                                          ? Colors.red
                                          : Colors.yellowAccent,
                                      size: 40,
                                    ),
                                    Text(
                                      '${OneHour}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: (OneHour.contains("-"))
                                            ? Colors.red
                                            : Colors.yellowAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // 24 Hour
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  '24h',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      (OneDay.contains("-"))
                                          ? Icons.arrow_drop_down_rounded
                                          : Icons.arrow_drop_up_rounded,
                                      color: (OneDay.contains("-"))
                                          ? Colors.red
                                          : Colors.yellowAccent,
                                      size: 40,
                                    ),
                                    Text(
                                      '${OneDay}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: (OneDay.contains("-"))
                                            ? Colors.red
                                            : Colors.yellowAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // 7 days
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  '7 days',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      (SevenD.contains("-"))
                                          ? Icons.arrow_drop_down_rounded
                                          : Icons.arrow_drop_up_rounded,
                                      color: (SevenD.contains("-"))
                                          ? Colors.red
                                          : Colors.yellowAccent,
                                      size: 40,
                                    ),
                                    Text(
                                      '${SevenD}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: (SevenD.contains("-"))
                                            ? Colors.red
                                            : Colors.yellowAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            //MarketCap
                            Text(
                              'Market Cap: \$${controller.coinsList[index].marketCap}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            //Max Supply
                            Text(
                              'Max Supply: ${controller.coinsList[index].maxSupply}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            //Total Supply
                            Text(
                              'Total Supply: ${controller.coinsList[index].totalSupply}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            //Circulating Supply
                            Text(
                              'Circulating Supply: ${controller.coinsList[index].circulatingSupply}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
  Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.network(controller.coinsList[index].image),
                ),
              ),
            ),
  */
