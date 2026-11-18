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

// by MAHO
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by MAHO
String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';
  String first = phone.substring(0, 3);
  String last = phone.substring(phone.length - 2);
  String stars = '*' * (phone.length - 5);
  return first + stars + last;
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

  String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}