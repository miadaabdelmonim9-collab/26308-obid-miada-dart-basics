
// Student: Miada Abdelmonim Hassan Obid
// Reg no: 26308

const String regNo = '26308';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count Vowels
// by MAHO
int countVowels(String text) {
  int count = 0;
  String lower = text.toLowerCase();
  int i = 0;

  while (i < lower.length) {
    String ch = lower[i];

    if (ch == 'a' || ch == 'e' || ch == 'i' ||
        ch == 'o' || ch == 'u') {
      count++;
    }

    i++;
  }

  return count;
}

// B3: Initials
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

// C5: Draw Triangle
// by MAHO
void drawTriangle(int height) {
  int row = 1;

  while (row <= height) {
    String spaces = '';
    String symbols = '';
    String symbol = row % 2 == 1 ? '*' : '#';

    int s = 0;
    while (s < height - row) {
      spaces += ' ';
      s++;
    }

    int j = 0;
    while (j < row) {
      symbols += symbol;
      j++;
    }

    print(spaces + symbols);
    row++;
  }
}

// D2: MoMo Fee
// by MAHO
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// D2: Mask Phone
// by MAHO
String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';

  String first = phone.substring(0, 3);
  String last = phone.substring(phone.length - 2);
  String stars = '';

  int i = 0;
  while (i < phone.length - 5) {
    stars += '*';
    i++;
  }

  return first + stars + last;
}

// Main Function
// by MAHO
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // B2: Count Vowels
  String fullName = 'Miada Abdelmonim Hassan Obid';
  int n = countVowels(fullName);
  print('$fullName has $n vowels');

  // B3: Initials
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5: Triangle
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2: MoMo Receipt Printer
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
