
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:universal_realism_art/domain/domain.dart';
import 'package:universal_realism_art/domain/entities/topic.dart';
import 'package:universal_realism_art/generated/translations.g.dart';
import 'package:universal_realism_art/presentation/bloc/bloc.dart';
import 'package:universal_realism_art/presentation/screens/art/widgets/topics_bar.dart';
import 'package:universal_realism_art/presentation/widgets/widgets.dart';
import 'package:universal_realism_art/themes.dart';


import 'widgets/pictures_list.dart';

class ArtScreen extends StatefulWidget {
  const ArtScreen();

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {

  var _isVisible = true;
  late ScrollController _hideBottomNavController;
  late RefreshController _refreshController;
  
  @override
  void initState() {
    super.initState();
    _hideBottomNavController = ScrollController();
    _refreshController = RefreshController(initialRefresh: false);
    _hideBottomNavController.addListener(() {
      if (_hideBottomNavController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible) {
          _isVisible = false;
          context.read<MenuBloc>().add(MenuHide());
        }
      } else if (_hideBottomNavController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isVisible) {
          _isVisible = true;
          context.read<MenuBloc>().add(MenuShow());
        }
      }
    });
  }

  @override
  void dispose() {
    _hideBottomNavController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    body: BackgroundScopeWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: SmartRefresher(
          header: const RefreshHeader(),
          enablePullDown: true,
          enablePullUp: true,          
          controller: _refreshController,
          scrollController: _hideBottomNavController,
          onRefresh: () {
            log('REFRESH');
            _refreshController
            ..refreshCompleted()
            ..loadNoData();
          },
          footer: RefreshFooter(
            noMoreDataMessage: t.mobileScreens.mdomPollsList.noMoreDataMessage,
            onTap: () {}            
          ),
          child: Theme(
            data: AppThemes.darkTheme,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TopicsBar(
                      sortByType: (value) {},
                      currentTopic: Topics.graphics,
                    ),
                  ),              
                  PicturesList(
                    pictures: List<Picture>.generate(4, (index) 
                    => Picture(
                      name: 'Разлив', 
                      year: '', 
                      description: 'Холст масло 90*90см; 1995гю', 
                      image: Image.asset(
                        'assets/images/Kischenko.png',
                        fit: BoxFit.fill,
                      )
                    )), 
                    hideBottomNavController: _hideBottomNavController
                  ), 
                ],
              ),
            ),
          ),       
        ),
      ),
    ),
    bottomNavigationBar: null,
  );
}