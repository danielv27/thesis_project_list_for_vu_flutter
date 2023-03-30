import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:system_for_vu_flutter/models/thesis_project.dart';

class ThesisProjectTable extends StatefulWidget {
  
  const ThesisProjectTable({
    Key? key,
  }) : super(key: key);

  @override
  State<ThesisProjectTable> createState() => _ThesisProjectTableState();
}

class _ThesisProjectTableState extends State<ThesisProjectTable> {

  List<ThesisProject> projects = [];
  List<String> tableHeaders = [];
  bool loading = true;

  Future<void> loadFile() async {
    String dataString = await rootBundle.loadString('assets/main_table.csv');
    List<List<String>> tableData = const CsvToListConverter().convert(dataString, shouldParseNumbers: false,);
    tableHeaders = tableData[1]; //current location of table headers
    tableData.removeAt(0); // because this table has an extra entry at the top
    tableData.removeAt(0); // remove table headers before parsing the projects
    projects = tableData.map((tableEntry) => ThesisProject.fromTableEntry(tableEntry)).toList();
    setState(() {
      loading = false;
    });
  }

  Widget cell(String text, bool isHeader) => Container(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1.5),
      borderRadius: BorderRadius.circular(15)
    ),
    width: MediaQuery.of(context).size.width * 0.7 * 0.2,
    child: AspectRatio(
      aspectRatio: 4,
      child: Text(
        text,
        style: TextStyle(fontWeight: isHeader ? FontWeight.bold: FontWeight.normal),
      ),
    )

  );

  Widget row(ThesisProject project) { 
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cell(project.supervisorName ?? "", false),
        cell(project.supervisorEmail ?? "", false),
        cell(project.dagreeType?.name ?? "", false),
        cell(project.program?.name ?? "", false),
        cell(project.secondReader ?? "", false),
        cell(project.projectDescription ?? "", false)

      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    if(projects.isEmpty) loadFile();
    if(loading) return const Center(child: CircularProgressIndicator());
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) => row(projects[index]),
            ),
          ),
      ],
    );
  }
}