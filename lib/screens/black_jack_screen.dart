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
  List<Image> dealerCards = [];

  // Cards
  String? dealersFirstCard;
  String? dealersSecondCard;

  String? playersFirstCard;
  String? playersSecondCard;

  // Scores
  int? dealerScore = 0;
  int? playerScore = 0;

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
  void changeCards() {
    // Start new round with full deckOfCards
    playingCards = {};
    playingCards.addAll(deckOfCards);
    // reset cards images
    myCards = [];
    dealerCards = [];

    Random random = Random();
    // Random card one for dealer
    String cardOneKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    // Remove cardOneKey from playingCards
    playingCards.removeWhere((key, value) => key == cardOneKey);
    // Random card two for dealer
    String cardTwoKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    playingCards.removeWhere((key, value) => key == cardTwoKey);
    // Random card three for the player
    String cardThreeKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    playingCards.removeWhere((key, value) => key == cardThreeKey);

    // Random card four for the player
    String cardFourKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    playingCards.removeWhere((key, value) => key == cardFourKey);
  }

  // Add extra card to player
  void addCard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isGameStarted
            ? SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        // Todo:- Add score here
                        Text("Dealer's score"),
                        // Dealer's cards
                        Container(
                          height: 200,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                // TODO:- Return dealer's cards here
                                return Container();
                              }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        // Todo:- Add score here
                        Text("Player's score"),
                        Container(
                          height: 200,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              // TODO:- Change itemCount to player's cards later
                              itemCount: 0,
                              itemBuilder: (context, index) {
                                // TODO:- Return player's cards here
                                return Container();
                              }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: Text("Another Card"),
                          color: Colors.brown[200],
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Text("Next Round"),
                          color: Colors.brown[200],
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Center(
                child: MaterialButton(
                    color: Colors.brown[200],
                    minWidth: 150,
                    onPressed: () {
                      setState(() {
                        _isGameStarted = true;
                      });
                    },
                    child: Text("Start Game"))));
  }
}
