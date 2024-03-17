import 'package:flutter/material.dart';

class JobCard2Widget extends StatefulWidget {
  const JobCard2Widget({Key? key}) : super(key: key);

  @override
  State<JobCard2Widget> createState() => _JobCard2WidgetState();
}

class _JobCard2WidgetState extends State<JobCard2Widget> {
  late TextEditingController textController;
  late FocusNode textFieldFocusNode;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 370,
          height: 190,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://picsum.photos/seed/549/600',
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Junior Web Developer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'CodeSphere - Colombo, Sri Lanka',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                          icon: Icon(Icons.add),
                          iconSize: 24,
                          color: Colors.black,
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 68,
                              height: 26,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Remote',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            Container(
                              width: 68,
                              height: 26,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Full-Time',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$1k/',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Opacity(
                              opacity: 0.6,
                              child: Text(
                                'mo',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
