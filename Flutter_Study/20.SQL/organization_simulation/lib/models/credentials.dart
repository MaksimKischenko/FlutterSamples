
abstract class Credentials {}

class AdmCredentials extends Credentials {

   Map<String, String> get credentials => {
    'adm1': 'admin',
    'adm2': 'admin',
    'adm3': 'admin'
   };
} 

class EmpCredentials extends Credentials {
  
  Map<String, String> get credentials => {
    'adm1': 'admin',
    'adm2': 'admin',
    'adm3': 'admin'
  };
} 

class FrlCredentials extends Credentials {
  
  Map<String, String> get credentials => {
    'frl1': 'frealancer',
    'frl2': 'frealancer',
    'frl3': 'frealancer'
  }; 

  
}
