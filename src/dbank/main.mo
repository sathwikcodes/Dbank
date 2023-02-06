import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";



actor Dbank{

  stable 
  var startTime = Time.now();
  Debug.print(debug_show(startTime));

  stable var currentValue : Float = 300;
  currentValue := 300;


   public func topUp(amount : Float) {
   currentValue += amount;
   Debug.print(debug_show(currentValue));
   };
   
   public func withdraw(amount : Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue >=0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Sorry You are BROKE!!")
    }

   };

   public query func checkBalance(): async Float{
    return currentValue;
   };

   public func compound() {
    let currentTIme = Time.now();
    let timeElapsedNs = currentTIme - startTime;
    let timesec = timeElapsedNs/1000000000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timesec));
    startTime := currentTIme;
   };
  
}