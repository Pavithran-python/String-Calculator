

int add(String numbers){
  int result = 0;
  if(numbers.isEmpty){
    result = 0;
  }
  else{
    result = int.parse(numbers);
  }
  return result;
}