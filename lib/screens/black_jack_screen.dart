import 'package:black_jack/widgets/cards_grid_view.dart';
import 'package:black_jack/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({super.key});

  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  bool _isGameStarted = false;

  // Card images
  List<Image> myCards = [];
  List<Image> dealersCards = [];

  // Cards
  String? dealersFirstCard;
  String? dealersSecondCard;

  String? playersFirstCard;
  String? playersSecondCard;

  // Scores
  int? dealersScore = 0;
  int? playersScore = 0;

  // Deck of cards
  final Map<String, int> deckOfCards = {
    "cards/2.1.png": 2,
    "cards/2.2.png": 2,
    "cards/2.3.png": 2,
    "cards/2.4.png": 2,
    "cards/3.1.png": 3,
    "cards/3.2.png": 3,
    "cards/3.3.png": 3,
    "cards/3.4.png": 3,
    "cards/4.1.png": 4,
    "cards/4.2.png": 4,
    "cards/4.3.png": 4,
    "cards/4.4.png": 4,
    "cards/5.1.png": 5,
    "cards/5.2.png": 5,
    "cards/5.3.png": 5,
    "cards/5.4.png": 5,
    "cards/6.1.png": 6,
    "cards/6.2.png": 6,
    "cards/6.3.png": 6,
    "cards/6.4.png": 6,
    "cards/7.1.png": 7,
    "cards/7.2.png": 7,
    "cards/7.3.png": 7,
    "cards/7.4.png": 7,
    "cards/8.1.png": 8,
    "cards/8.2.png": 8,
    "cards/8.3.png": 8,
    "cards/8.4.png": 8,
    "cards/9.1.png": 9,
    "cards/9.2.png": 9,
    "cards/9.3.png": 9,
    "cards/9.4.png": 9,
    "cards/10.1.png": 10,
    "cards/10.2.png": 10,
    "cards/10.3.png": 10,
    "cards/10.4.png": 10,
    "cards/J1.png": 10,
    "cards/J2.png": 10,
    "cards/J3.png": 10,
    "cards/J4.png": 10,
    "cards/Q1.png": 10,
    "cards/Q2.png": 10,
    "cards/Q3.png": 10,
    "cards/Q4.png": 10,
    "cards/K1.png": 10,
    "cards/K2.png": 10,
    "cards/K3.png": 10,
    "cards/K4.png": 10,
    "cards/A1.png": 11,
    "cards/A2.png": 11,
    "cards/A3.png": 11,
    "cards/A4.png": 11,
  };

  Map<String, int> playingCards = {};

  @override
  void initState() {
    super.initState();
    playingCards.addAll(deckOfCards);
  }

  // Reset the round and reset cards
  void startNewRound() {
    _isGameStarted = true;
    // Start new round with full deckOfCards
    playingCards = {};
    playingCards.addAll(deckOfCards);
    // reset cards images
    myCards = [];
    dealersCards = [];

    Random random = Random();
    // Random card one for dealer
    String cardOneKey = playingCards.keys.elementAt(random
        .nextInt(playingCards.length)); // from 0 to playingCards.keys.length
    // Remove cardOneKey from playingCards
    playingCards.removeWhere((key, value) => key == cardOneKey);
    // Random card two for dealer
    String cardTwoKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    playingCards.removeWhere((key, value) => key == cardTwoKey);
    // Random card three for the player
    String cardThreeKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardThreeKey);

    // Random card four for the player
    String cardFourKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardFourKey);

    // Assign cards keys to dealerCards
    dealersFirstCard = cardOneKey;
    dealersSecondCard = cardTwoKey;

    // Assign cards keys to palyer's cards
    playersFirstCard = cardThreeKey;
    playersSecondCard = cardFourKey;

    // Adding dealers cards images to display them in grid view
    dealersCards.add(Image.asset(dealersFirstCard!));
    dealersCards.add(Image.asset(dealersSecondCard!));

    // Score for dealer
    dealersScore =
        deckOfCards[dealersFirstCard]! + deckOfCards[dealersSecondCard]!;

    // Adding player's cards images to display them in grid view
    myCards.add(Image.asset(playersFirstCard!));
    myCards.add(Image.asset(playersSecondCard!));

    // Score for player (my score)
    playersScore =
        deckOfCards[playersFirstCard]! + deckOfCards[playersSecondCard]!;
    if (dealersScore! <= 14) {
      String thirdDealersCard =
          playingCards.keys.elementAt(random.nextInt(playingCards.length));
      dealersCards.add(Image.asset(thirdDealersCard));
      dealersScore = dealersScore! + deckOfCards[thirdDealersCard]!;
    }

    setState(() {});
  }

  // Add extra card to player
  void addCard() {
    Random random = Random();
    if (playingCards.length > 0) {
      String cardKay =
          playingCards.keys.elementAt(random.nextInt(playingCards.length));
      playingCards.removeWhere((key, value) => key == cardKay);
      myCards.add(Image.asset(cardKay));
      playersScore = playersScore = deckOfCards[cardKay]!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isGameStarted
          ? SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Dealer's score: $dealersScore",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: dealersScore! <= 21
                                ? Colors.green[900]
                                : Colors.red[900],
                          ),
                        ),
                        // Dealer's cards
                        Container(
                          height: 200,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: dealersCards.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13.0),
                                  child: dealersCards[index],
                                );
                              }),
                        ),
                        CardGridView(cards: dealersCards),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Player\'s score: $playersScore",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: playersScore! <= 21
                                    ? Colors.green[900]
                                    : Colors.red[900])),
                        CardGridView(cards: myCards),
                      ],
                    ),
                    IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(onPressed: () {}, label: "Add Card"),
                          CustomButton(
                            onPressed: () {
                              startNewRound();
                            },
                            label: "Next Round",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: CustomButton(
                  onPressed: () => startNewRound(), label: "Start Game"),
            ),
    );
  }
}
