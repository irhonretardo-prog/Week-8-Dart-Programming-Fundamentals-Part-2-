void main() {
  String customerName = 'Irhon Clark A. Retardo';
  int coffeeCount = 3;
  double pricePerCup = 2.75;
  bool appliesForDiscount = true;

  print('=== COFFEE RECEIPT ===');
  print('Customer Name: $customerName');

  try {
    double finalTotal = calculateTotal(coffeeCount, pricePerCup, appliesForDiscount);
    int wholeDollarAmount = finalTotal ~/ 1;
    int freeStampRemainder = coffeeCount % 3;

    print('Total Price: \$${finalTotal.toStringAsFixed(2)}');
    print('Whole Dollars Spent: \$$wholeDollarAmount');
    print('Loyalty Stamp Progress: $freeStampRemainder cup(s) towards next reward');

    bool qualifiesForFreeCookie = finalTotal >= 15.0;
    bool getsMemberPerk = appliesForDiscount && qualifiesForFreeCookie;

    print('Qualifies for Free Cookie? $qualifiesForFreeCookie');
    print('Eligible for Member Perk? $getsMemberPerk');

    print('\nTotal Item Amount:');
    for (int i = 1; i <= coffeeCount; i++) {
      print('  Cup #$i: \$${pricePerCup.toStringAsFixed(2)}');
    }

  } catch (e) {
    print('Error processing order: $e');
  }
}

double calculateTotal(int coffeeCount, double pricePerCup, bool appliesForDiscount) {
  if (coffeeCount <= 0 || pricePerCup <= 0) {
   print('Coffee count and price must be greater than zero.');
  }

  double total = coffeeCount * pricePerCup;

  if (appliesForDiscount) {
    total *= 0.90;
  }

  return total;
}
