import 'dart:convert';

import 'package:bytebank2/http/webclient.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response responce =
        await client.get(baseUrl).timeout(Duration(seconds: 5));

    final List<dynamic> decodedJson = jsonDecode(responce.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(
            json)) //map - transforma uma lista em uma nova lista
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password, //1000
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    _throwHttpError(response.statusCode);
  }

  void _throwHttpError(int statusCode) =>
      throw Exception(_statusCodeResponses[statusCode]);

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed'
  };
}
