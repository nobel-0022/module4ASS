
import 'dart:io';


abstract class Account {
  // Define properties
  String name;
  double balance;
  int accountNumber;
  // Constructor
  Account(this.name, this.balance, this.accountNumber);
  // Define abstract methods
  void  deposit(double amount);
  void withdraw(double amount);
  double getBalance();
}
class SavingsAccount extends Account {
  // Define additional property
  double interestRate;
  // Constructor
  SavingsAccount(String name, double balance, int accountNumber, this.interestRate)
      : super(name, balance, accountNumber);
  // Implement abstract method
  @override
  void withdraw(double amount) {
    // Subtract the specified amount from the account balance
    balance -= amount;
    // Apply the interest rate to the remaining balance
    balance += balance * interestRate;
  }
}
class CurrentAccount extends Account {
  // Define additional property
  double overdraftLimit;
  // Constructor
  CurrentAccount(String name, double balance, int accountNumber, this.overdraftLimit)
      : super(name, balance, accountNumber);
  // Implement abstract method
  @override
  void withdraw(double amount) {
    // Allow withdrawals up to the overdraft limit
    if (amount <= overdraftLimit) {
      balance -= amount;
    } else {
      // Print message indicating insufficient funds
      print("Insufficient funds");
    }
  }
}
void main() {
  // Create an instance of the SavingsAccount class
  SavingsAccount savingsAccount =
  SavingsAccount("John Doe", 1000.0, 123456789, 0.05);
  // Perform operations on the SavingsAccount instance
  savingsAccount.deposit(500.0);
  savingsAccount.withdraw(200.0);
  print("Savings account balance: ${savingsAccount.getBalance()}");
  // Create an instance of the CurrentAccount class
  CurrentAccount currentAccount =
  CurrentAccount("Jane Doe", 2000.0, 987654321, 500.0);
  // Perform operations on the CurrentAccount instance
  currentAccount.deposit(1000.0);
}



