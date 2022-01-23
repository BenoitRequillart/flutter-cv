import 'package:cv_benoit/model/airtable_data_education.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_benoit/utils/config.dart';

class AirtableData {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.ProjectBase}/education",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataEduction>> getEducation() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataEduction> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataEduction(
                id: value['id'],
                createdTime: value['createdTime'],
                title: value['fields']['title'],
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
