import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class UpdateScoreWidget extends StatefulWidget {
  const UpdateScoreWidget({super.key});

  @override
  State<UpdateScoreWidget> createState() => _UpdateScoreWidgetState();
}

class _UpdateScoreWidgetState extends State<UpdateScoreWidget> {
  TextEditingController homeTeamTextController = TextEditingController();
  TextEditingController awayTeamTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    // to convert into a custom textField
                    SizedBox(
                      width: 60,
                      height: 60, // Define a height for the SizedBox
                      child: TextField(
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]$')),
                        ],
                        controller: homeTeamTextController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          border: OutlineInputBorder(),
                          //hintText: '0', // Set default text to '0'
                        ),
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                        onChanged: (input) {},
                      ),
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.arrow_upward),
                          ),
                        ),
                        const Gap(8),
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.arrow_downward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(32),
              Expanded(
                child: Column(
                  children: [
                    // to convert into a custom textField
                    SizedBox(
                      width: 60,
                      height: 60, // Define a height for the SizedBox
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]$')),
                        ],
                        controller: awayTeamTextController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          border: OutlineInputBorder(),
                          //hintText: '0', // Set default text to '0'
                        ),
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                        onChanged: (input) {},
                      ),
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.arrow_upward),
                          ),
                        ),
                        const Gap(8),
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.arrow_downward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
