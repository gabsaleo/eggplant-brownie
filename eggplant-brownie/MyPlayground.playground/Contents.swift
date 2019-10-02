import UIKit

class Meal{
    var happiness: Int?
    var name:String?
}
let comida = Meal()
comida.name = "coxinha"
print(comida.name)
print(comida.happiness)

if let coxinha = comida.name{
  print(coxinha)
}else{
    print("vazio")
}


