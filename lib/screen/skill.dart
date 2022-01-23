import 'package:cv_benoit/model/airtable_data_skill.dart';
import 'package:flutter/material.dart';
import 'package:cv_benoit/models/airtable_data_skill.dart';

class SkillScreen extends StatelessWidget {
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
                future: airtableData.getSkill(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataSkill>> snapshot) {
                  print(airtableData.getSkill());
                  if (snapshot.hasData) {
                    List<AirtableDataSkill>? values = snapshot.data;
                    return ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: values!
                          .map<Widget>(
                            (AirtableDataSkill value) => ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(value.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                      )),
                                  ),
                                  Wrap(
                                      children:
                                          // for (var skill in value.skills) {
                                          //  Image.network(skill['url']),
                                          // }
                                          value.skills
                                              .map<Widget>((e) => Container(
                                                    height: 36,
                                                    width: 36,
                                                    child:
                                                        Image.network(e['url']),
                                                  ))
                                              .toList())
                                ],
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
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
