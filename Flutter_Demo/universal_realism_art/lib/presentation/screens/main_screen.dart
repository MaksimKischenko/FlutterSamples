import 'package:universal_realism_art/domain/domain.dart';
import 'package:universal_realism_art/presentation/bloc/bloc.dart';
import 'package:universal_realism_art/presentation/presentation.dart';
import 'package:universal_realism_art/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  bool _isVisible = true; 
  int selectedBottomNavigationIndex = 0;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;  

  static Map<MenuTab, Widget> screensTabs = const{
    MenuTab.art: ArtScreen(),
    MenuTab.info: ShopsScreen(),        
    MenuTab.settings: SettingsScreen(),
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {
        _isVisible = state.isVisible;
        if (_isVisible) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },      
      builder: (context, state) => Scaffold(
        body: BackgroundScopeWrapper(
          child: SafeArea(
            child: Stack(
              children: [
                IndexedStack(
                  index: screensTabs.keys.toList().indexWhere((e) => e == state.tab),
                  children: screensTabs.values.toList(),
                ),
                CustomBottomNavBar(
                  position: _offsetAnimation,
                  currentIndex: screensTabs.keys.toList().indexOf(state.tab),
                  onItemTapped: _onItemTapped,
                )
              ],  
            ),
          ),
        ),
    ));
    
   void _onItemTapped(int index) {
    selectedBottomNavigationIndex = index;
    context.read<MenuBloc>().add(MenuTabUpdate(tab: screensTabs.keys.toList()[index]));
  } 
}
