

import 'package:custom_onliner_app/bloc/goods_bloc.dart';
import 'package:custom_onliner_app/styles.dart';
import 'package:custom_onliner_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                            context.read<GoodsBloc>().add(GoodsInfoRun(productName: value));
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
                         
                         var items = state.infoTabs.products;

                         body = SizedBox(
                           height: 400,
                           child: ListView.builder(
                             itemCount: items?.length,
                             itemBuilder: (context, index) {
                               return Card(
                                 child: Column(
                                   children: [
                                     Text('${items?[index].name}'),
                                     SizedBox(height: 10),
                                     Text('${items?[index].priceInfo?.priceMin?.amount}'),
                                     SizedBox(height: 10),
                                     Text('${items?[index].priceInfo?.priceMax?.amount}'),
                                     SizedBox(height: 10),
                                   ],
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