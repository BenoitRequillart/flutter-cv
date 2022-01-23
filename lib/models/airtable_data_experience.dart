import 'package:cv_benoit/model/airtable_data_experience.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_benoit/utils/config.dart';

class AirtableData {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.ProjectBase}/experience",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataExperience>> getExperience() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataExperience> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataExperience(
                id: value['id'],
                createdTime: value['createdTime'],
                title: value['fields']['title'],
                function: value['fields']['function'],
                date: value['fields']['date'],
                content: value['fields']['content'],
                logo: value['fields']['logo'][0]['url']),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
