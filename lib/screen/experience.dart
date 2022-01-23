import 'package:cv_benoit/model/airtable_data_experience.dart';
import 'package:flutter/material.dart';
import 'package:cv_benoit/models/airtable_data_experience.dart';

class ExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),

      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: airtableData.getExperience(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataExperience>> snapshot) {
                  print(airtableData.getExperience());
                  if (snapshot.hasData) {
                    List<AirtableDataExperience>? values = snapshot.data;

                    return ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: values!
                          .map<Widget>(
                            (AirtableDataExperience value) => ListTile(
                                leading: Container(
                                  height: 36,
                                  width: 36,
                                  child: Image.network(value.logo),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(value.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                        )
                                    ),
                                    Text(
                                      value.function,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.green),
                                    ),
                                    Text(value.content)
                                  ],
                                ),
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                              ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }
}
