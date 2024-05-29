import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:organization_simulation/database/workers_database.dart';
import 'package:organization_simulation/utils/utils.dart';





part 'comon_statistic_event.dart';
part 'comon_statistic_state.dart';

class ComonStatisticBloc extends Bloc<ComonStatisticEvent, ComonStatisticState> {
  ComonStatisticBloc() : super(ComonStatisticLoading());
  
  @override
  Stream<ComonStatisticState> mapEventToState(
    ComonStatisticEvent event,
  ) async* {
    if(event is ComonStatisticInit) {
      yield* _mapComonStatisticInitToState(event);
    }else if (event is ComonStatisticDownLoad) {
      yield* _mapComonStatisticDownLoadToState(event);
    }
  }


Stream<ComonStatisticState> _mapComonStatisticInitToState (
    ComonStatisticInit event 
  ) async* { 

    try {
     final response  = await WorkersDataBaseHelper.instance.allWorkers();
    yield ComonStatisticInitial();
    } catch (error, _) {
      yield ComonStatisticInitialError(
        error: error
      );
   }    
  }
   

  Stream<ComonStatisticState> _mapComonStatisticDownLoadToState (
    ComonStatisticDownLoad event 
  ) async* {
    yield ComonStatisticLoading();
    try {
      final response  = await WorkersDataBaseHelper.instance.allWorkers();

      final excel = Excel.createExcel();
      final sheetName = 'AuditLog.${DateFormat('dd-MM-yyyy').format(DateTime.now())}';
      excel.rename('Sheet1', sheetName);

      final headers = ['Id','Name','Position', 'Salary', 'HoursInMonth'];
      excel[sheetName].insertRowIterables(headers, 0);

      final headerCellStyle = CellStyle(horizontalAlign: HorizontalAlign.Center, bold: true, underline: Underline.Single);
      final headerCells = excel[sheetName].selectRange(CellIndex.indexByString('A1'), end: CellIndex.indexByString('E1'));
      headerCells.first!.forEach((cell) {
        cell?.cellStyle=headerCellStyle;
        });

      response.forEachIndexed((e, i) {
        excel[sheetName].insertRowIterables(<dynamic>[e.id, e.name, e.position, e.salary, e.hoursInMonth], i+1);
      });

      for (int i = 0; i < 7; i++) {
          excel[sheetName].setColWidth(i, 30.0);
      }

      excel[sheetName].setColWidth(7, 25.0);
      final fileBytes = excel.save(fileName: '$sheetName.xlsx');

      
  //   var fileBytes = excel.save();
  //   var directory = await getApplicationDocumentsDirectory();

  //   File(join("$directory/$sheetName.xlsx"))
  // ..createSync(recursive: true)
  // ..writeAsBytesSync(fileBytes!);





      
    
      yield ComonStatisticSucces (
        fileName: '$sheetName.xlsx',
        rowCount: response.length
      );
   } catch (error, _) {
     yield ComonStatisticError(
     error: error);
   }
    
  }

 

}
