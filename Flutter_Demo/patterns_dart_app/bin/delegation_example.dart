abstract final interface class Recipe {
  Set<String> get ingredients;
  int get cost;
  void cook();
}

final class Salad implements Recipe {
  @override
  Set<String> get ingredients => {'Cabbage', 'Tomatoes', 'Cucumber'};
  
  @override
  int get cost => 100;

  @override
  void cook() {
    print('Salad is cooked');
  }
}

final class SpecialSalad implements Recipe {
  final _salad = Salad();
  
  @override
  Set<String> get ingredients => _salad.ingredients..add('CurrySauce');
  
  @override
  int get cost => _salad.cost + 15;
  
  @override
  void cook() {
    print('Cooking special salad');
    _salad.cook();
  }
  
  void vip() {
    print('Vip method');
  }
}

void debug(Recipe recipe) {
  print('Ingredients: ${recipe.ingredients}');
  print('Cost: ${recipe.cost}');
  recipe.cook();
}

extension SpecialRecipe on Recipe {
  Set<String> get specialIngredients => this.ingredients..add('CurrySauce');
  
  int get specialCost => this.cost + 15;
  
  void specialCook() {
    print('Cooking special salad');
    this.cook();
  }
  
  void vip() {
    print('Vip method');
  }
}

// void debug(Recipe recipe) {
//   print('Ingredients: ${recipe.ingredients}');
//   print('Cost: ${recipe.cost}');
//   recipe.cook();
// }

void specialDebug(Recipe recipe) {
  print('Ingredients: ${recipe.specialIngredients}');
  print('Cost: ${recipe.specialCost}');
  recipe.specialCook();
}


// mixin Salad on Recipe {
//   Set<String> get ingredients => super.ingredients..addAll({'Cabbage', 'Tomatoes', 'Cucumber'});
  
//   int get cost => super.cost + 100;
  
//   void cook() {
//     print('Salad is cooked');
//   }
// }

// class SpecialSalad extends Recipe with Salad {
//   Set<String> get ingredients => super.ingredients..add('CurrySauce');
  
//   int get cost => super.cost + 15;  
  
//   void vip() {
//     print("VIP Method");
//   }
// }

// void debug(Recipe recipe) {
//   print('Ingredients: ${recipe.ingredients}');
//   print('Cost: ${recipe.cost}');
//   recipe.cook();
// }

