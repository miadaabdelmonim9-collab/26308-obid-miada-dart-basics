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

// by MAHO
String initials(String fullName) {
  List<String> parts = fullName.trim().split(' ');
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += parts[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return result;
}

// by MAHO
void drawTriangle(int height) {
  int row = 1;
  while (row <= height) {
    String spaces = ' ' * (height - row);
    String symbol = row % 2 == 1 ? '*' : '#';
    print(spaces + symbol * row);
    row++;
  }
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Miada Abdelmonim Hassan Obid';
  int n = countVowels(fullName);
  print('$fullName has $n vowels');

  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);
}