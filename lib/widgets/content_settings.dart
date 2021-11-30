import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:sira/state/content_settings_state.dart';

class ContentSettings extends StatelessWidget {
  const ContentSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    'Размер текста',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: CupertinoSlider(
                          value: context
                              .watch<ContentSettingsState>()
                              .getCurrentTextSize
                              .toDouble(),
                          min: 14,
                          max: 50,
                          onChanged: (value) {
                            context.read<ContentSettingsState>().updateTextSize(
                                  value.toInt(),
                                );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${context.watch<ContentSettingsState>().getCurrentTextSize}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
