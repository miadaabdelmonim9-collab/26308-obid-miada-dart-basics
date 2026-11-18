
 // Student: Miada Abdelmonim Hassan Obid
// Reg no: 26308

const String regNo = '26308';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by MAHO
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by MAHO
String formatRwf(int amount) {
  bool negative = amount < 0;
  String digits = (negative ? -amount : amount).toString();

  String result = '';
  int count = 0;
  int i = digits.length - 1;

  while (i >= 0) {
    result = digits[i] + result;
    count++;

    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }

    i--;
  }

  if (negative) {
    result = '-' + result;
  }

  return '$result RWF';
}

// by MAHO
bool isValidPin(String pin) {
  if (pin.length != 5) return false;

  int i = 0;

  while (i < pin.length) {
    if (!'0123456789'.contains(pin[i])) {
      return false;
    }
    i++;
  }

  if (pin == '12345') return false;

  bool allSame = true;
  int j = 1;

  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      allSame = false;
    }
    j++;
  }

  if (allSame) return false;

  return true;
}

// by MAHO
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');

  return newBalance;
}

// by MAHO
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print('Airtime bought: ${formatRwf(amount)}. '
      'New balance: ${formatRwf(newBalance)}');

  return newBalance;
}

// by MAHO
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. PIN checks
  print(isValidPin('12345'));
  print(isValidPin('4821$d'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));

  // 2. Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. Transactions
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. My own tests

  // formatRwf tests
  print(formatRwf(0)); // 0 RWF
  print(formatRwf(999)); // 999 RWF
  print(formatRwf(100000)); // 100,000 RWF
  print(formatRwf(1250000)); // 1,250,000 RWF
  print(formatRwf(-1234567)); // -1,234,567 RWF (negative number with commas)

  // isValidPin tests
  print(isValidPin('00000')); // false
  print(isValidPin('54321')); // true
  print(isValidPin('')); // false
}
