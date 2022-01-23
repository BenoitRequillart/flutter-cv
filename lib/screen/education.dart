import 'package:cv_benoit/model/airtable_data_education.dart';
import 'package:flutter/material.dart';
import 'package:cv_benoit/models/airtable_data_education.dart';

class EducationScreen extends StatelessWidget {
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
                future: airtableData.getEducation(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataEduction>> snapshot) {
                  print(airtableData.getEducation());
                  if (snapshot.hasData) {
                    List<AirtableDataEduction>? values = snapshot.data;

                    return ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: values!
                          .map<Widget>(
                            (AirtableDataEduction value) => ListTile(
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
