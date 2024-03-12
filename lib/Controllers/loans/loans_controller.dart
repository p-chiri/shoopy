import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoanController extends GetxController {
  RxDouble loanAmount = 0.0.obs;
  RxInt age = 0.obs;

  void setLoanAmount(double amount) {
    loanAmount.value = amount;
  }

  void setAge(int userAge) {
    age.value = userAge;
  }

  String get loanSummary {
    // Customize your loan awarding logic here based on loanAmount and age
    double interestRate = 0.05; // 5% interest rate
    double totalLoanAmount = loanAmount.value * (1 + interestRate);

    return 'Loan Approved!\nLoan Amount: \$${loanAmount.value.toStringAsFixed(2)}\nTotal Payable: \$${totalLoanAmount.toStringAsFixed(2)}';
  }
}
