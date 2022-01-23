import 'package:cv_benoit/model/airtable_data_skill.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_benoit/utils/config.dart';

class AirtableData {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.ProjectBase}/skill",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataSkill>> getSkill() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataSkill> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataSkill(
                id: value['id'],
                createdTime: value['createdTime'],
                title: value['fields']['title'],
                skills: value['fields']['skills']),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
