import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobbed/components/skill_model.dart';
import 'package:provider/provider.dart';

// Define the SkillModel class

class SkillWidget extends StatefulWidget {
  const SkillWidget({Key? key}) : super(key: key);

  @override
  _SkillWidgetState createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  late SkillModel _model;

  @override
  void initState() {
    super.initState();
    _model = SkillModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _model,
      child: Consumer<SkillModel>(
        builder: (context, model, child) {
          return Opacity(
            opacity: 0.8,
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: 393,
                  height: 77,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Color(0xFF4D4D4D),
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.certificate,
                              color: Colors.black,
                              size: 24,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Skill',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 12,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
