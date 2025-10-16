void main() {
print("maps");
 final Map <String, dynamic> pokemon1 = {
   'name': 'ditto',
   'hp': 100,
   'isAlive': true,
   'abilities': <String>['impostor'],
   'sprities': {
     1: 'src/ditto1.jpg',
     2: 'src/ditto2.jpg'
   }
 };
 print(pokemon1);
 print(pokemon1['name']);
 print(pokemon1['sprites']);
 print(pokemon1['isAlive']);
}