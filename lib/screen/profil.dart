import 'package:flutter/material.dart';
import 'package:cv_benoit/model/airtable_data_profil.dart';
import 'package:cv_benoit/models/airtable_data_profil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cv_benoit/widget/ico_link.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();
    return SingleChildScrollView(
      padding: EdgeInsets.all(30),

      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/assets/moi.jpg'),
              maxRadius: 100,
              backgroundColor: Colors.green,
            ),
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ico_link(
                FontAwesomeIcons.twitter,
                "https://twitter.com/KingjulianTz",
              ),
              ico_link(
                FontAwesomeIcons.linkedin,
                "https://fr.linkedin.com/in/benoit-requillart-b54135175",
              )
            ],
          ),

          ///
          /// @todo: la liste...
          ///
          Container(
            child: FutureBuilder(
                future: airtableData.getProfil(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
                  if (snapshot.hasData) {
                    List<AirtableDataProfil>? values = snapshot.data;
                    return ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: values!
                          .map<Widget>(
                            (AirtableDataProfil value) => ListTile(
                                leading: Text(
                                  value.icon,
                                  style: const TextStyle(
                                      fontFamily: 'MaterialIcons',
                                      fontSize: 24),
                                ),
                                title: Text(value.content)),
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
