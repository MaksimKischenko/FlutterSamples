import 'package:universal_realism_art/color_styles.dart';
import 'package:universal_realism_art/domain/entities/topic.dart';
import 'package:universal_realism_art/generated/translations.g.dart';
import 'package:universal_realism_art/utils/utils.dart';
import 'package:flutter/material.dart';

class TopicsBar extends StatelessWidget {
  final Function(Topics value) sortByType;
  final Topics currentTopic;

  const TopicsBar({
    Key? key,
    required this.sortByType,
    required this.currentTopic
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Title(
          color: ColorStyles.thirdColor, 
          child: Text(
            t.mobileScreens.main.menu.art,
            style: TextStyle(
              fontSize: 32,
              color: ColorStyles.mainColor
            ),
          )
        ),
      ),              
      Wrap(
        children: Topics.values
          .mapIndexed((e, index) => Padding(
            padding: const EdgeInsets.all(2),
            child: FilledButton(      
              style: ButtonStyle(
                backgroundColor: currentTopic == Topics.values[index]? 
                MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary) : null
              ),                         
              child: Text(TopicsName.topicKeys[e] ?? '',
                  style: TextStyle(
                    color: ColorStyles.whiteColor
                  )
              ),
              onPressed: () => sortByType(Topics.values[index]),
            ),
        )).toList(),
      ),
    ],
  );
}
