import 'package:cv_benoit/model/airtable_data_experience.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_benoit/utils/config.dart';
import 'package:cv_benoit/model/airtable_data_profil.dart';
import 'package:cv_benoit/model/airtable_data_experience.dart';
 
class AirtableData {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.ProjectBase}/profil",
    {"maxRecords": "10", "view": "Grid view"},
  );
 
  Future<List<AirtableDataProfil>> getProfil() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );
 
 
    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];
 
 
      List<AirtableDataProfil> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataProfil(
              id: value['id'],
              createdTime: value['createdTime'],
              content: value['fields']['content'],
              icon: value['fields']['icon'],
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}