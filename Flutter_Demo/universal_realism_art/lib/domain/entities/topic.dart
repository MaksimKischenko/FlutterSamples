import 'package:universal_realism_art/generated/translations.g.dart';


enum Topics {
  graphics, 
  landscape,
  portrait,
  stillLife,
  mosaics,
  tapestries
}

mixin TopicsName {
  static final Map<Topics, String> topicKeys = {
    Topics.graphics: t.mobileScreens.topics.graphics,
    Topics.landscape: t.mobileScreens.topics.landscape,
    Topics.portrait: t.mobileScreens.topics.portrait,
    Topics.stillLife: t.mobileScreens.topics.stillLife,    
    Topics.mosaics: t.mobileScreens.topics.portrait,
    Topics.tapestries: t.mobileScreens.topics.stillLife,        
  };
}


