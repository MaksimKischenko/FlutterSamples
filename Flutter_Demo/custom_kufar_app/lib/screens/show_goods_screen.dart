import 'package:custom_kufar_app/bloc/goods_bloc.dart';
import 'package:custom_kufar_app/styles.dart';
import 'package:custom_kufar_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:custom_kufar_app/date_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowGoodsScreen extends StatefulWidget {
  const ShowGoodsScreen({ Key? key }) : super(key: key);

  @override
  State<ShowGoodsScreen> createState() => _ShowGoodsScreenState();
}

class _ShowGoodsScreenState extends State<ShowGoodsScreen> with TickerProviderStateMixin {

  TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                    const ImageContainer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Material(
                        elevation: 40,
                        child: SearchTextField(
                          controller: searchTextController, 
                          onTap: (value) {
                            context.read<GoodsBloc>().add(GoodsInfoRun(
                                productName: value,
                                listSize: 2000
                              )
                            );
                          }
                        ),
                      ),
                    ),
                    BlocBuilder<GoodsBloc, GoodsInfoState>(
                      builder: (context, state) {

                       Widget body = Container();

                       if(state is GoodsInfoLoading) {
                         body = const CircularProgressIndicator(
                           color: AppStyles.mainColor,
                         );
                       } else if (state is GoodsInfoSuccess) {
                         
                         var items = state.infoTabs.adsItemList;

                         body = SizedBox(
                           height: 400,
                           child: ListView.builder(
                             itemCount: items?.length,
                             itemBuilder: (context, index) {
                               return SizedBox(
                                 height: 120,
                                 child: Card(
                                   child: Column(
                                     children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            var link = items?[index].adLink;
                                              if(await canLaunch(link ?? '')) {
                                                await launch(link ?? '', forceSafariVC: false);
                                              } else {
                                                throw 'Could not launch $items?[index].adLink ?? ''';
                                              } 
                                          },
                                          child: ListTile(
                                            leading: Text('${items?[index].listTime.toStringFormattedGetOperationHistory()}'),
                                            title: Text('${items?[index].subject}'),                                  
                                          ),
                                        ),
                                      )
                                     ],
                                   ),
                                 ),
                               );
                             },
                           ),
                         );
                       }
                        // return ListView.builder(
                        //   itemBuilder: itemBuilder
                        // );
                        return body;
                      }
                    )
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}