// Student: Miada Abdelmonim Hassan Obid
// Reg no: 26308
const String regNo = '26308';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by MAHO
int countVowels(String text) {
  int count = 0;
  String lower = text.toLowerCase();
  int i = 0;
  while (i < lower.length) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
    i++;
  }
  return count;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Miada Abdelmonim Hassan Obid';
  int n = countVowels(fullName);
  print('$fullName has $n vowels');
}