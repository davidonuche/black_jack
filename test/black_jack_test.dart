import 'package:flutter_test/flutter_test.dart';

import 'src/cards.dart';

void main() {
  group("Start game with cards", () {
    Cards cards = Cards();

    test(
        "Total number of cards",
        () => expect(cards.playingCards.length, 52,
            reason: "Cards don't have 52 cards at start"));
    test("My cards are empty", () {
      expect(cards.myCards, isEmpty, reason: "My cards are not empty");
    });
    test("Dealer's cards are empty", () {
      expect(cards.dealersCards, isEmpty,
          reason: "Dealers cards are not empty");
    });
    test(
        "Dealer's first card is null",
        () => expect(cards.dealersFirstCard, isNull,
            reason: "Dealer's first card is not null"));
    test(
        "Dealer's second card is null",
        () => expect(cards.dealersSecondCard, isNull,
            reason: "Dealer's second card is not null"));
    test(
        "Player's first card is null",
        () => expect(cards.playersFirstCard, isNull,
            reason: "Player's first card is not null"));
    test(
        "Player's second card is null",
        () => expect(cards.playersSecondCard, isNull,
            reason: "Player's second card is not null"));
  });
  group("Start new round", () {
    Cards cards = Cards();
    cards.startNewRound();
    test("Number of cards", () {
      // 52 - 4 = 48
      expect(cards.playingCards.length, 48);
    });
    test(
        "Player's first card is not null",
        () => expect(cards.playersFirstCard, isNotNull,
            reason: "Player's first card is null"));
    test("Player's second card is not null", () {
      expect(cards.playersSecondCard, isNotNull,
          reason: "Player's second card is null");
    });
    test(
        "Dealer's first card is not null",
        () => expect(cards.dealersFirstCard, isNotNull,
            reason: "Dealer's first card is null"));
    test("Dealer's second card is not null", () {
      expect(cards.dealersSecondCard, isNotNull,
          reason: "Dealer's second card is null");
    });
    test(
        "My cards have 2 cards",
        () => expect(cards.myCards.length, 2,
            reason: "My cards don't have two cards"));
    test(
        "Dealer's has 2 cards",
        () => expect(cards.dealersCards.length, 2,
            reason: "Dealer's cards don't have two cards"));
  });

  group("Add Card", () {
    Cards cards = Cards();
    cards.addCard();
    test(
        "Total number of cards",
        () => expect(cards.playingCards.length, 51,
            reason: "Total number of cards are not equal to 51"));
    test(
        "My cards have 1 card",
        () => expect(
              cards.myCards.length,
              1,
              reason: "My cards don't have one card",
            ));
  });
}
