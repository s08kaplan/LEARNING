
void main() {
  User user1 = User("Ali", "Veli", "22/08/1980", "aliveli@mail.com", "05551234545", "AV123456789", 100, id:"AV123456" );
print(user1.firstName);
print(user1.telephone);
print(user1.email);
print(user1.email);
print("*" * 20);
print(car1.year);
car1.vehicleInfo();
}


class User {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String email;
  final String telephone;
  final String account;
   int? userMoney;
  final String _id; 
  User(this.firstName, this.lastName, this.dateOfBirth, this.email, this.telephone, this.account, this.userMoney, {required String id}): _id = id;
 bool get isEmptyId => _id.isEmpty; 
}


abstract class IVehicle {
   final String name;
   final String model;
   final int year;
   final String color;

   IVehicle(this.name, this.model, this.year, this.color);

   int get vehicleAge => DateTime.now().year - year;

   void vehicleInfo(){
    print("Your vehicle has name: $name, model: $model, color: $color and it is $vehicleAge years old");
   }

}

class Car extends IVehicle {
  final String name;
   final String model;
   final int year;
   final String color;
   Car(this.name, this.model, this.year, this.color) : super(name, model, year, color);
}


Car car1 = Car("Hacı Murat", "124", 1980, "white" );
