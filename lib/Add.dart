
bool isNumber({required String getChar}){
  return RegExp(r'\d+').hasMatch(getChar);
}

int add(String numbers){
  int result = 0;
  String numberString = '';
  for(int i = 0 ; i < numbers.length ; i++){
    String char = numbers[i];
    if(isNumber(getChar: char)){
      numberString += char;
      if((i+1) == numbers.length){
        int convertNumber = int.parse(numberString);
        result += convertNumber;
      }
    }
    else{
      if(numberString.isNotEmpty){
        int convertNumber = int.parse(numberString);
        result += convertNumber;
        numberString = '';
      }
    }
  }
  return result;
}