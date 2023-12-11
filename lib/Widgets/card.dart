import 'package:flutter/material.dart';
import 'package:new_crypto_app/Screens/coin_screen.dart';

class CoinCard extends StatefulWidget {
  final String coinName;
  final String coinValue;
  final String coinImage;
  final String OneHour;
  final String OneDay;
  final String SevenD;
  final int index;

  const CoinCard({
    Key? key,
    required this.coinName,
    required this.coinValue,
    required this.coinImage,
    required this.OneHour,
    required this.OneDay,
    required this.SevenD,
    required this.index,
  }) : super(key: key);

  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("${widget.coinName} card is tapped.");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoinScreen(index: widget.index),
          ),
        );
      },
      child: Card(
        color: const Color(0xFF0C8CE9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.0),
        ),
        child: SizedBox(
          width: 420,
          height: 170,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Coin Image BOX
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.network(widget.coinImage),
                  ),
                ),
              ),
              //Coin Info BOX
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  widget.coinName,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isFavorite = !isFavorite;
                                      });
                                    },
                                    icon: isFavorite
                                        ? Icon(
                                            Icons.star_rounded,
                                            color: Colors.amberAccent,
                                          )
                                        : Icon(Icons.star_border_rounded),
                                    tooltip: 'Add to Favorite!',
                                    iconSize: 35,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // 1 Hour
                        Column(
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
                                  (widget.OneHour.contains("-"))
                                      ? Icons.arrow_drop_down_rounded
                                      : Icons.arrow_drop_up_rounded,
                                  color: (widget.OneHour.contains("-"))
                                      ? Colors.red
                                      : Colors.yellowAccent,
                                  size: 40,
                                ),
                                Text(
                                  '${widget.OneHour}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: (widget.OneHour.contains("-"))
                                        ? Colors.red
                                        : Colors.yellowAccent,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        // 24 Hour
                        Column(
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
                                  (widget.OneDay.contains("-"))
                                      ? Icons.arrow_drop_down_rounded
                                      : Icons.arrow_drop_up_rounded,
                                  color: (widget.OneDay.contains("-"))
                                      ? Colors.red
                                      : Colors.yellowAccent,
                                  size: 40,
                                ),
                                Text(
                                  '${widget.OneDay}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: (widget.OneDay.contains("-"))
                                        ? Colors.red
                                        : Colors.yellowAccent,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        // 7 days
                        Column(
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
                                  (widget.SevenD.contains("-"))
                                      ? Icons.arrow_drop_down_rounded
                                      : Icons.arrow_drop_up_rounded,
                                  color: (widget.SevenD.contains("-"))
                                      ? Colors.red
                                      : Colors.yellowAccent,
                                  size: 40,
                                ),
                                Text(
                                  '${widget.SevenD}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: (widget.SevenD.contains("-"))
                                        ? Colors.red
                                        : Colors.yellowAccent,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9.0),
                      child: Text(
                        '${widget.coinValue} \$',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
