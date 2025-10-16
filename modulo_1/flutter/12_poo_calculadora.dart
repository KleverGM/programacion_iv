void main() {
  final Calculadora calcular = Calculadora( numero1: 5.2,
numero2: 8);
  print(calcular.suma());
  print(calcular.resta());
  print(calcular.multi());
  print(calcular.division());
  
}

class Calculadora{
  double numero1= 0.0;
  double numero2= 0.0;
  Calcualdora({required this.numero1, required this.numero2});
  
  double suma(){
    return this.numero1+this.numero2;
  }
  double resta(){
    return this.numero1-this.numero2;
  }
  double multi(){
    return this.numero1*this.numero2;
  }
  double division(){
    return this.numero1+this.numero2;
  }
  
}