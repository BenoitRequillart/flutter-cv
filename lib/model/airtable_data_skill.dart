// model/airtable_data_skill.dart

class AirtableDataSkill {
  String id;
  String createdTime;
  String title;
  List<dynamic> skills;

  AirtableDataSkill(
      {required this.id,
      required this.createdTime,
      required this.title,
      required this.skills});
}
