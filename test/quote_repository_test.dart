import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:random_quote/models/models.dart';
import 'package:random_quote/repositories/quote_api_client.dart';
import 'package:random_quote/repositories/quote_repository.dart';

class MockQuoteApiClient extends Mock implements QuoteApiClient {}

void main() {
  group('assertion', () {
    final mockHttpClient = MockQuoteApiClient();
    test('should assert if null', () async {
      expect(
        () => QuoteRepository(quoteApiClient: null),
        throwsA(isAssertionError),
      );
      when(mockHttpClient.fetchQuote()).thenAnswer((_) async =>
          Future.value(Quote(id: 13, quoteAuthor: "aut", quoteText: "text")));

      expect(
        await QuoteRepository(quoteApiClient: mockHttpClient).fetchQuote(),
          Quote(id: 13, quoteAuthor: "aut", quoteText: "text")
      );
    });
  });
}
