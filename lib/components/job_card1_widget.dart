import 'package:flutter/material.dart';

import 'job_card1_model.dart';
export 'job_card1_model.dart';

class JobCard1Widget extends StatefulWidget {
  const JobCard1Widget({Key? key});

  @override
  State<JobCard1Widget> createState() => _JobCard1WidgetState();
}

class _JobCard1WidgetState extends State<JobCard1Widget> {
  late JobCard1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => JobCard1Model());

    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 271,
        height: 215,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://picsum.photos/seed/199/600',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 24,
                            ),
                            iconSize: 24,
                            color: Colors.white,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'UI/UX Designer',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'CodeX - Colombo, Sri Lanka',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 68,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Remote',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            width: 68,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Full-Time',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '\$1k/',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Opacity(
                            opacity: 0.6,
                            child: Text(
                              'mo',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
