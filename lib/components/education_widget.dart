import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'education_model.dart';

class EducationWidget extends StatefulWidget {
  const EducationWidget({Key? key}) : super(key: key);

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  late EducationModel _model;

  @override
  void initState() {
    super.initState();
    _model = Provider.of<EducationModel>(context, listen: false);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _model.onUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 393,
            height: 77,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.graduationCap,
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
                        'Education',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 24,
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
  }
}
