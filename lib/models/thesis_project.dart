// ignore_for_file: constant_identifier_names

enum DagreeType{
  Bsc,
  Msc
}

enum Program{
  CS,
  AI,
  IS,
  BA
}

DagreeType? stringToDagreeType(String value) {
  if(value.contains("Bachelor")){
    return DagreeType.Bsc;
  }
  if(value.contains("Master")){
    return DagreeType.Bsc;
  }
  return null;
}

Program? stringToProgram(String value) {
  if(value.contains("CS")){
    return Program.CS;
  }
  if(value.contains("AI")){
    return Program.AI;
  }
  if(value.contains("IS")){
    return Program.IS;
  }
  if(value.contains("BA")){
      return Program.BA;
  }
  return null;

}


class ThesisProject{

  final String? supervisorName;
  final String? supervisorEmail;
  final DagreeType? dagreeType;
  final Program? program;
  final String? secondReader;
  final String? projectDescription;

  ThesisProject({
    required this.supervisorName,
    required this.supervisorEmail,
    required this.dagreeType,
    required this.program,
    required this.secondReader,
    required this.projectDescription
  });

  factory ThesisProject.fromTableEntry(List<String> entry) { 
    return ThesisProject(
      supervisorName: entry[0],
      supervisorEmail: entry[1], 
      dagreeType: stringToDagreeType(entry[2]),
      program: stringToProgram(entry[2]), 
      secondReader: entry[3], 
      projectDescription: entry[4]
    );
  }


}