import 'package:flutter/material.dart';
import 'package:system_for_vu_flutter/models/thesis_project.dart';

class ThesisProjectTableRow extends StatefulWidget {

  final ThesisProject project;

  const ThesisProjectTableRow({
    Key? key,
    required this.project
  }) : super(key: key);

  @override
  State<ThesisProjectTableRow> createState() => _ThesisProjectTableRowState();
}

class _ThesisProjectTableRowState extends State<ThesisProjectTableRow> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}