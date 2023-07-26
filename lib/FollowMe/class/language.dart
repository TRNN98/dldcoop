// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/pages/interest/interest_page.dart';

class Language {
  // MainMenu
  static reandfo(m, l) {
    if (m == 'regis') {
      return l == 'en' ? "Membership Registration" : "ลงทะเบียนสมาชิก";
    }
    if (m == 'forget') {
      return l == 'en' ? "Forgot Password" : "ลืมรหัสผ่าน";
    }
    if (m == 'name') {
      return l == 'en' ? "Name " : "ชื่อ";
    }
    if (m == 'lastName') {
      return l == 'en' ? "Last Name" : "นามสกุล";
    }
  }

  static menuLg(m, l) {
    if (m == 'share') {
      return l == 'en' ? "Share" : "ทุนเรือนหุ้น";
    }
    if (m == 'loan') {
      return l == 'en' ? "Loan" : "เงินกู้";
    }
    if (m == 'deposit') {
      return l == 'en' ? "Deposit" : "เงินฝาก";
    }
    if (m == 'guarantee') {
      return l == 'en' ? "Guarantee" : "ภาระค้ำประกัน\nสัญญาเงินกู้";
    }
    if (m == 'kept') {
      return l == 'en' ? "Billed Monthly" : "เรียกเก็บรายเดือน\n/ ใบเสร็จ";
    }
    if (m == 'dividend') {
      return l == 'en' ? "Dividend" : "เงินปันผล\nเงินเฉลี่ยคืน";
    }
    if (m == 'gain') {
      return l == 'en' ? "Beneficiary" : "ผู้รับโอนผลประโยชน์";
    }
    if (m == 'memberref') {
      return l == 'en' ? "Beneficiary" : "สมาชิกสมทบ";
    }
    if (m == 'new') {
      return l == 'en' ? "New" : "ข่าวประชาสัมพันธ์";
    }
    if (m == 'welcome') {
      return l == 'en' ? "Welcome" : "ยินดีต้อนรับ";
    }
    if (m == 'offset') {
      return l == 'en' ? "offset" : "รายการหักกลบหนี้";
    }
    if (m == 'bank') {
      return l == 'en' ? "bank" : "บัญชีธนาคารสหกรณ์ฯ";
    }
    if (m == 'coopMail') {
      return l == 'en' ? '' : 'หนังสือส่ง\nสหกรณ์ฯ';
    }
    if (m == 'StatusLoan') {
      return l == 'en' ? '' : 'ติดตามสถานะคำขอกู้';
    }
    if (m == 'keptSpecial') {
      return l == 'en' ? '' : 'ใบเสร็จชำระพิเศษและหักกลบ';
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "อัตราดอกเบี้ย";
    }
    if (m == 'contact') {
      return l == 'en' ? "ติดต่อเจ้าหน้าที่" : "ติดต่อเจ้าหน้าที่";
    }
  }

  static shareLg(m, l) {
    if (m == 'shareContractInformation') {
      return l == 'en'
          ? "Share Contract Information"
          : "รายละเอียดทุนเรือนหุ้น";
    }
    if (m == 'ShareMonth') {
      return l == 'en' ? "Sstatus" : "หุ้นเรียกเก็บ";
    }
    if (m == 'Sstatus') {
      return l == 'en' ? "Sstatus" : "สถานะการส่งรายเดือน";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - นามสกุล";
    }
    if (m == 'share') {
      return l == 'en' ? "Share" : "ทุนเรือนหุ้น";
    }
    if (m == 'period') {
      return l == 'en' ? "Period" : "งวดล่าสุด";
    }
    if (m == 'monthlyShare') {
      return l == 'en' ? "Monthly share" : "หุ้นรายเดือน";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'period1') {
      return l == 'en' ? "Period" : "งวด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'amountM') {
      return l == 'en' ? "" : "ยอดคงเหลือ";
    }
  }

  static loanLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - นามสกุล";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'loan') {
      return l == 'en' ? "Loan" : "เงินกู้";
    }
    if (m == 'contractStartDate') {
      return l == 'en' ? "Contract start date  " : "วันที่เริ่มสัญญา";
    }
    if (m == 'period') {
      return l == 'en' ? "Period  " : "งวดล่าสุด";
    }
    if (m == 'period1') {
      return l == 'en' ? "Period" : "งวด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }

    if (m == 'paymentInInstallments') {
      return l == 'en' ? "Payment installments: " : "ส่งชำระงวดละ";
    }
    if (m == 'loanContractInformation') {
      return l == 'en'
          ? "Loan contract information"
          : "ข้อมูลรายละเอียดสัญญาเงินกู้";
    }
    if (m == 'listOfLoanAgreements') {
      return l == 'en' ? "List of loan agreements" : "รายการสัญญาเงินกู้";
    }
    if (m == 'loanContractNumber') {
      return l == 'en' ? "Loan contract number" : "เลขที่สัญญาเงินกู้";
    }
    if (m == 'approvalLimit') {
      return l == 'en' ? "Approval limit" : "วงเงินอนุมัติ";
    }
    if (m == 'periodAll') {
      return l == 'en' ? "Period All" : "จำนวนงวด";
    }
    if (m == 'payment') {
      return l == 'en' ? "Payment" : "การส่งชำระ";
    }
    if (m == 'balance') {
      return l == 'en' ? "Balance" : "ยอดคงเหลือสุทธิ";
    }
    if (m == 'showGuarantees') {
      return l == 'en' ? "Guarantees" : "ดูหลักประกัน";
    }
    if (m == 'showMovementlist') {
      return l == 'en' ? "Movement" : "ดูรายการเคลื่อนไหว";
    }
    if (m == 'loanMovementlist') {
      return l == 'en' ? "Movement" : "รายการเคลื่อนไหวหนี้";
    }
    if (m == 'guaranteeAmount') {
      return l == 'en' ? "Guarantee amount" : "วงเงินค้ำประกัน";
    }
    if (m == 'collateralForLoanAgreement') {
      return l == 'en'
          ? "Collateral for loan agreement"
          : "หลักประกันสัญญาเงินกู้";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'principal') {
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
    if (m == 'amountLoan') {
      return l == 'en' ? "amount Loan" : "จำนวนเงิน";
    }
    if (m == 'loan_interest_rate') {
      return l == 'en' ? "loan_interest_rate" : "อัตราดอกเบี้ย";
    }
    if (m == 'loantotal') {
      return l == 'en' ? "หนี้คงเหลือ" : "หนี้คงเหลือ";
    }
  }

  static deposit(m, l) {
    if (m == 'depositContractInformation') {
      return l == 'en'
          ? "Deposit contract information"
          : "ข้อมูลรายละเอียดบัญชีเงินฝาก";
    }
    if (m == 'depositBalanceAll') {
      return l == 'en' ? "depositBalanceAll" : "ยอดเงินคงเหลือทั้งหมด";
    }
    if (m == 'balance') {
      return l == 'en' ? "balance" : "คงเหลือ(บาท)";
    }
    if (m == 'guaranteeAmount') {
      return l == 'en' ? "guaranteeAmount" : "เงินที่ค้ำประกัน";
    }
    if (m == 'monthlyDepositAmount') {
      return l == 'en' ? "Monthly deposit amount" : "เงินฝากรายเดือน";
    }
    if (m == 'currentInterestRate') {
      return l == 'en' ? "current interest rate" : "ดอกเบี้ยสะสม";
    }
    if (m == 'atmCoop') {
      return l == 'en' ? "atm-Coop" : "ATM-CO-OP";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - นามสกุล";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'deposit') {
      return l == 'en' ? "Deposit" : "เงินฝาก";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'depositAccountDetails') {
      return l == 'en' ? "Deposit account details" : "รายละเอียดบัญชีเงินฝาก";
    }
    if (m == 'accountNumber') {
      return l == 'en' ? "Account Number" : "เลขที่บัญชี";
    }
    if (m == 'accountName') {
      return l == 'en' ? "Account Name" : "ชื่อบัญชี";
    }
    if (m == 'accountType') {
      return l == 'en' ? "Account Type" : "ประเภทบัญชี";
    }
    if (m == 'accountOpeningDate') {
      return l == 'en' ? "Account open date" : "วันที่เปิดบัญชี";
    }
    if (m == 'remainingAmount') {
      return l == 'en' ? "Remaining amount" : "จำนวนเงินคงเหลือ";
    }
    if (m == 'amountWithdrawn') {
      return l == 'en' ? "Amount withdrawn" : "จำนวนเงินที่ถอนได้";
    }
    if (m == 'seeMovements') {
      return l == 'en' ? "Account movements" : "ดูรายการเคลื่อนไหว";
    }
    if (m == 'accountMovements') {
      return l == 'en' ? "Account movements" : "รายการเคลื่อนไหวบัญชี";
    }
    if (m == 'balance') {
      return l == 'en' ? "Balance" : "คงเหลือ";
    }
  }

  static guaranteeLg(m, l) {
    if (m == 'LoanApprove') {
      return l == 'en' ? "LoanApprove" : "หนี้คงเหลือ";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'guaranteeLoanAgreement') {
      return l == 'en'
          ? "Guarantee the loan agreement"
          : "ค้ำประกันสัญญาเงินกู้";
    }
    if (m == 'loanCollateral') {
      return l == 'en' ? "Loan collateral" : "หลักประกันเงินกู้";
    }
    if (m == 'guarantees') {
      return l == 'en' ? "Guarantees" : "การค้ำประกัน";
    }
    if (m == 'detail') {
      return l == 'en' ? "detail" : "รายการค้ำประกัน";
    }
    if (m == 'debt') {
      return l == 'en' ? "Debt" : "ยอดคงเหลือ";
    }
  }

  static dividendLg(m, l) {
    if (m == 'rate') {
      return l == 'en' ? "rate" : "ดอกเบี้ยสะสมระหว่างปี(บาท)";
    }
    if (m == 'bank') {
      return l == 'en' ? "bank" : "เลขที่บัญชี";
    }
    if (m == 'RefundDate') {
      return l == 'en' ? "Refund date" : "วันที่จ่ายคืน";
    }
    if (m == 'paymentDate') {
      return l == 'en' ? "payment date" : "วันที่จ่าย";
    }
    if (m == 'payBack') {
      return l == 'en' ? "pay back" : "จ่ายคืน(บาท)";
    }
    if (m == 'somtob') {
      return l == 'en' ? "somtob" : "สมทบ";
    }
    if (m == 'totalNetReceipts') {
      return l == 'en' ? "Total net receipts" : "รวมรับสุทธิ";
    }
    if (m == 'status') {
      return l == 'en' ? "Status" : "สถานะ";
    }
    if (m == 'status') {
      return l == 'en' ? "Status" : "สถานะ";
    }
    if (m == 'payOffDebt') {
      return l == 'en' ? "pay off debt" : "ชำระหนี้(บาท)";
    }
    if (m == 'dividendRate') {
      return l == 'en' ? "Dividend rate" : "อัตราปันผล";
    }
    if (m == 'averageRate') {
      return l == 'en' ? "Average refund rate" : "อัตราเฉลี่ยคืน";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'dividend') {
      return l == 'en' ? "Dividend" : "ปันผล";
    }
    if (m == 'averageRefund') {
      return l == 'en' ? "Average refund" : "เฉลี่ยคืน";
    }
    if (m == 'dividendAverageRefund') {
      return l == 'en'
          ? "Dividend-Average refund"
          : "เงินปันผล - เงินเฉลี่ยคืน";
    }
    if (m == 'fiscalYear') {
      return l == 'en' ? "Fiscal year" : "ปีบัญชี";
    }
    if (m == 'getMoney') {
      return l == 'en' ? "Get money" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'dividendAverageDetail') {
      return l == 'en'
          ? "Dividend-Average Detail"
          : "จ่ายเงินปันผล-เงินเฉลี่ยคืน";
    }
    if (m == 'printDividend') {
      return l == 'en' ? "printDividend" : "พิมพ์รายการ ปันผล-เฉลี่ยคืน";
    }
  }

  static gainLg(m, l) {
    if (m == 'typeaccount') {
      return l == 'en' ? "typeaccount" : "ประเภทการจ่าย";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'gain') {
      return l == 'en' ? "Beneficiary" : "ผู้รับโอนผลประโยชน์";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "บัตรประชาชน";
    }
    if (m == 'relationship') {
      return l == 'en' ? "relationship" : "ความสัมพันธ์";
    }
  }

  static coopMailLg(m, l) {
    if (m == 'subject') {
      return l == 'en' ? "เรื่อง" : "รายละเอียด";
    }
    if (m == 'date') {
      return l == 'en' ? "วันที่ลงรับ" : "วันที่ลงรับ";
    }
    if (m == 'number') {
      return l == 'en' ? "เลขที่หนังสือ" : "เลขที่หนังสือ";
    }
    if (m == 'coopmail') {
      return l == 'en' ? "หนังสือส่งสหกรณ์ฯ" : "หนังสือส่งสหกรณ์ฯ";
    }
  }

  static StatusLoanLg(m, l) {
    if (m == 'StatusLoan') {
      return l == 'en' ? "ติดตามสถานะคำขอกู้" : "ติดตามสถานะคำขอกู้";
    }
    if (m == 'typeLoan') {
      return l == 'en' ? "ประเภทเงินกู้" : "ประเภทเงินกู้";
    }
    if (m == 'numberLoan') {
      return l == 'en' ? "เลขที่ขอกู้" : "เลขที่ขอกู้";
    }
    if (m == 'dateLoan') {
      return l == 'en' ? "วันที่ขอกู้" : "วันที่ขอกู้";
    }
    if (m == 'status') {
      return l == 'en' ? "สถานะ" : "สถานะ";
    }
    if (m == 'dateApproved') {
      return l == 'en' ? "วันที่อนุมัติ" : "วันที่อนุมัติ";
    }
    if (m == 'loanAmount') {
      return l == 'en' ? "วงเงินขอกู้" : "วงเงินขอกู้";
    }
    if (m == 'approvedAmount') {
      return l == 'en' ? "จำนวนเงินอนุมัติ" : "จำนวนเงินอนุมัติ";
    }

    if (m == 'approvedAmount') {
      return l == 'en' ? "จำนวนเงินอนุมัติ" : "จำนวนเงินอนุมัติ";
    }
    if (m == 'paymentChannel') {
      return l == 'en' ? "ช่องทางการรับเงิน" : "ช่องทางการรับเงิน";
    }
    if (m == 'note') {
      return l == 'en' ? "ติดตามสถานะ" : "ติดตามสถานะ";
    }
    if (m == 'note_detail') {
      return l == 'en'
          ? ""
          : "  ขอแจ้งเอกสารการกู้เงิน เงินกู้สามัญเพิ่มเติม ดังนี้\n1. หนังสือค้ำประกันเงินกู้สามัญ(ประพันธ์)ไม่รับรองสภานภาพโสด กรุณาส่งเอกสารเพิ่มเติมเพื่ออนุมัติเงินกู้ต่อไป \n\nเจ้าหน้าที่สินเชื่อ นางประภรณ์ วิเศษสังข์\nโทร 091-890-5910";
    }
    if (m == 'loanRequestDetail') {
      return l == 'en' ? "รายละเอียดสถานะคำขอกู้" : "รายละเอียดสถานะคำขอกู้";
    }
  }

  static keptSpecialLg(m, l) {
    if (m == 'AmounLob') {
      return l == 'en' ? "AmounLob" : "เงินติดลบ";
    }
    if (m == 'AmounNot') {
      return l == 'en' ? "AmounNot" : "เงินเก็บได้";
    }
    if (m == 'CountDetail') {
      return l == 'en' ? "CountDetail" : "จำนวนรายการ";
    }
    if (m == 'StatusReceipt') {
      return l == 'en' ? "StatusReceipt" : "เลขที่สัญญาเงินกู้ใหม่";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - นามสกุล";
    }
    if (m == 'kept') {
      return l == 'en'
          ? "ใบเสร็จชำระพิเศษและหักกลบ"
          : "ใบเสร็จชำระพิเศษและหักกลบ";
    }
    if (m == 'keptdetail') {
      return l == 'en' ? "Billed Monthly" : "รายการเรียกเก็บ";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'total') {
      return l == 'en' ? "รวมชำระ" : "รวมชำระ ";
    }
    if (m == 'date') {
      return l == 'en' ? "วันที่" : "วันที่";
    }
    if (m == 'detail') {
      return l == 'en' ? "รายละเอียด" : "รายละเอียด";
    }
    if (m == 'receiptNumber') {
      return l == 'en' ? "Receipt number" : "เลขที่ใบเสร็จ";
    }
    if (m == 'receiptDate') {
      return l == 'en' ? "Receipt Date" : "วันที่ใบเสร็จ";
    }
    if (m == 'totalPayment') {
      return l == 'en' ? "Billed Charge" : "รวมเงินที่ชำระ";
    }
    if (m == 'additionalAmountPaid') {
      return l == 'en' ? "Additional Amount to be Paid" : "ยอดที่ต้องชำระเพิ่ม";
    }
    if (m == 'month') {
      return l == 'en' ? "Month" : "เดือน";
    }
    if (m == 'year') {
      return l == 'en' ? "Year" : "ปี";
    }
    if (m == 'printBilledMonthly') {
      return l == 'en'
          ? "พิมพ์ใบเสร็จชำระพิเศษและหักกลบ"
          : "พิมพ์ใบเสร็จชำระพิเศษและหักกลบ";
    }
    if (m == 'printKeptM') {
      return l == 'en' ? "พิมพ์ใบเรียกเก็บ" : "พิมพ์ใบเรียกเก็บ";
    }
    if (m == 'principal') {
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
    if (m == 'receipt') {
      return l == 'en' ? "Receipt" : "ใบเสร็จรับเงิน";
    }
    if (m == 'billingStatement') {
      return l == 'en' ? "Billing statement" : "ใบแจ้งยอดเรียกเก็บ ";
    }
    if (m == 'canNotPrint') {
      return l == 'en'
          ? "Still can't print the receipt. Because the transaction has not yet been posted"
          : "ยังไม่สามารถพิมพ์ใบเสร็จได้ เนื่องจากยังไม่ผ่านรายการ";
    }
    if (m == 'numberOfItems') {
      return l == 'en' ? "" : "จำนวนรายการ ";
    }
    if (m == 'kept_special_detail') {
      return l == 'en' ? "รายละเอียดข้อมูลใบเสร็จ" : "รายละเอียดข้อมูลใบเสร็จ ";
    }
  }

  static InterestLg(m, l) {
    if (m == 'Interest') {
      return l == 'en' ? "typeaccount" : "อัตราดอกเบี้ย";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'type') {
      return l == 'en' ? "Membership" : "ประเภท";
    }
    if (m == 'DepositInterestRates') {
      return l == 'en' ? "อัตราเงินฝาก" : "อัตราดอกเบี้ยเงินฝาก";
    }

    if (m == 'LoanInterestRates') {
      return l == 'en' ? "อัตราเงินกู้" : "อัตราดอกเบี้ยเงินกู้";
    }
    if (m == 'gain') {
      return l == 'en' ? "Beneficiary" : "ผู้รับโอนผลประโยชน์";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "บัตรประชาชน";
    }
    if (m == 'InterestPerYear') {
      return l == 'en' ? "relationship" : "อัตราดอกเบี้ย (ต่อปี)";
    }
  }

  static keptLg(m, l) {
    if (m == 'AmounLob') {
      return l == 'en' ? "AmounLob" : "เงินติดลบ";
    }
    if (m == 'AmounNot') {
      return l == 'en' ? "AmounNot" : "เงินเก็บได้";
    }
    if (m == 'CountDetail') {
      return l == 'en' ? "CountDetail" : "จำนวนรายการ";
    }
    if (m == 'StatusReceipt') {
      return l == 'en' ? "StatusReceipt" : "สถานะ";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - นามสกุล";
    }
    if (m == 'kept') {
      return l == 'en' ? "Billed Monthly" : "เรียกเก็บเงินรายเดือน/ใบเสร็จ";
    }
    if (m == 'keptdetail') {
      return l == 'en' ? "Billed Monthly" : "รายการเรียกเก็บ";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'receiptNumber') {
      return l == 'en' ? "Receipt number" : "เลขที่ใบเสร็จ";
    }
    if (m == 'receiptDate') {
      return l == 'en' ? "Receipt Date" : "วันที่ใบเสร็จ";
    }
    if (m == 'billedCharge') {
      return l == 'en' ? "Billed Charge" : "ยอดเรียกเก็บ";
    }
    if (m == 'additionalAmountPaid') {
      return l == 'en' ? "Additional Amount to be Paid" : "ยอดที่ต้องชำระเพิ่ม";
    }
    if (m == 'month') {
      return l == 'en' ? "Month" : "เดือน";
    }
    if (m == 'year') {
      return l == 'en' ? "Year" : "ปี";
    }
    if (m == 'printBilledMonthly') {
      return l == 'en' ? "Print Billed Monthly" : "พิมพ์ใบเสร็จ";
    }
    if (m == 'printKeptM') {
      return l == 'en' ? "พิมพ์ใบแจ้งยอดเรียกเก็บ" : "พิมพ์ใบแจ้งยอดเรียกเก็บ";
    }
    if (m == 'principal') {
      //
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
    if (m == 'receipt') {
      return l == 'en' ? "Receipt" : "ใบเสร็จรับเงิน";
    }
    if (m == 'billingStatement') {
      return l == 'en' ? "Billing statement" : "ใบแจ้งยอดเรียกเก็บ ";
    }
    if (m == 'canNotPrint') {
      return l == 'en'
          ? "Still can't print the receipt. Because the transaction has not yet been posted"
          : "ยังไม่สามารถพิมพ์ใบเสร็จได้ เนื่องจากยังไม่ผ่านรายการ";
    }
    if (m == 'payAmount') {
      return l == 'en' ? "" : "รวมได้รับชำระ ";
    }
  }

  static memberrefLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'memberref') {
      return l == 'en' ? "Share Detail" : "รายละเอียดทุนเรือนหุ้น";
    }
    if (m == 'memberrefs') {
      return l == 'en' ? "Share" : "สมาชิกสมทบ";
    }
    if (m == 'loan') {
      return l == 'en' ? "Loan" : "เงินกู้";
    }
    if (m == 'monthlyShare') {
      return l == 'en' ? "Monthly share" : "หุ้นรายเดือน";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'period1') {
      return l == 'en' ? "Period" : "งวด";
    }
    if (m == 'deposit') {
      return l == 'en' ? "Deposit" : "เงินฝาก";
    }
    if (m == 'dividend') {
      return l == 'en' ? "Dividend" : "ปันผล";
    }
  }

  static profileLg(m, l) {
    if (m == 'present_telephone') {
      return l == 'en' ? "present_telephone: " : "เบอร์โทรบ้าน";
    }
    if (m == 'present_mobile') {
      return l == 'en' ? "present_mobile: " : "เบอร์โทรศัพท์";
    }
    if (m == 'BANK_ACC_NO') {
      return l == 'en' ? "BANK_ACC_NO: " : "เลขที่บัญชี : ";
    }
    if (m == 'mem_type') {
      return l == 'en' ? "Status" : "ประเภท";
    }
    if (m == 'mem_status') {
      return l == 'en' ? "mem_status: " : "สถานะสมาชิก : ";
    }
    if (m == 'no_group_prename') {
      return l == 'en' ? "รหัสหน่วย : " : "รหัสหน่วย";
    }
    if (m == 'member_group_prename') {
      return l == 'en' ? "member_group_prename" : "ชื่อหน่วย";
    }
    if (m == 'GROUP_PAY_DES') {
      return l == 'en' ? "GROUP_PAY_DES: " : "วิธีรับปันผล : ";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership: " : "ทะเบียนสมาชิก";
    }
    if (m == 'status') {
      return l == 'en' ? "status : " : "สถานะ";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card: " : "บัตรประชาชน : ";
    }
    if (m == 'dateOfApprove') {
      return l == 'en' ? "Date of membership: " : "วันที่อนุมัติ";
    }
    if (m == 'birthday') {
      return l == 'en' ? "Birthday: " : "วันเกิด";
    }
    if (m == 'age') {
      return l == 'en' ? "อายุ" : "อายุ";
    }
    if (m == 'dateOfMembership') {
      return l == 'en' ? "Date of membership: " : "วันที่เป็นสมาชิก : ";
    }
    if (m == 'dateOfRegisingation') {
      return l == 'en' ? "Date of Regisingation: " : "วันที่ลาออก";
    }
    if (m == 'ageOfmember') {
      return l == 'en' ? "อายุสมาชิก" : "อายุสมาชิก";
    }
    if (m == 'phone') {
      return l == 'en' ? "Phone: " : "เบอร์โทรศัพท์";
    }
    if (m == 'sex') {
      return l == 'en' ? "เพศ" : "เพศ";
    }
    if (m == 'blood_type') {
      return l == 'en' ? "กรุ๊ปเลือด" : "กรุ๊ปเลือด";
    }

    if (m == 'department') {
      return l == 'en' ? "Department: " : "หน่วยงาน";
    }
    if (m == 'address') {
      return l == 'en' ? "Address: " : "ที่อยู่";
    }
    if (m == 'phone') {
      return l == 'en' ? "Address: " : "เบอร์โทร";
    }
    if (m == 'profile') {
      return l == 'en' ? "Profile" : "ข้อมูลส่วนตัว";
    }
    if (m == 'camera') {
      return l == 'en' ? "Camera" : "กล้อง";
    }
    if (m == 'gallery') {
      return l == 'en' ? "Gallery" : "คลังภาพ";
    }
    if (m == 'cancel') {
      return l == 'en' ? "Cancel" : "ยกเลิก";
    }
    if (m == 'upload') {
      return l == 'en' ? "Upload" : "เปลี่ยน";
    }
    if (m == 'MARRIAGE_STATUS') {
      return l == 'en' ? "MARRIAGE_STATUS" : "สถานภาพ: ";
    }
    if (m == 'BANK_NAME') {
      return l == 'en' ? "BANK_NAME" : "ธนาคาร: ";
    }
  }

  static offsetLg(m, l) {
    if (m == 'detail') {
      return l == 'en' ? "loan contract no new" : "รายละเอียด";
    }
    if (m == 'principal') {
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
    if (m == 'receptAmount1') {
      return l == 'en' ? "recept amount" : "รวมชำระ";
    }
    if (m == 'loanContractNoNew') {
      return l == 'en' ? "loan contract no new" : "เลขที่สัญญาเงินกู้ใหม่";
    }
    if (m == 'receptAmount') {
      return l == 'en' ? "recept amount" : "รวมเงินที่ชำระ";
    }
    if (m == 'CountDetail') {
      return l == 'en' ? "CountDetail" : "จำนวนรายการ";
    }
    if (m == 'receiptDate') {
      return l == 'en' ? "Receipt Date" : "วันที่ใบเสร็จ";
    }
    if (m == 'receiptNumber') {
      return l == 'en' ? "Receipt number" : "เลขที่ใบเสร็จ";
    }
    if (m == 'offset') {
      return l == 'en' ? "offset" : "รายการหักกลบหนี้";
    }
    if (m == 'printoffset') {
      return l == 'en' ? "printoffset" : "พิมพ์รายการหักกลบหนี้";
    }

    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - นามสกุล";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่";
    }
  }

  static settingLg(m, l) {
    if (m == 'setting') {
      return l == 'en' ? "Setting" : "ตั้งค่า";
    }
    if (m == '') {
      return l == 'en' ? "" : "";
    }
    if (m == 'about') {
      return l == 'en' ? "About" : "เกี่ยวกับ";
    }
    if (m == 'passwordSecurity') {
      return l == 'en' ? "Password Security" : "ความปลอดภัยของรหัสผ่าน";
    }
    if (m == 'language') {
      return l == 'en' ? "Language" : "ภาษา";
    }
    if (m == 'about') {
      return l == 'en' ? "About" : "เกี่ยวกับ";
    }
    if (m == 'touchAndFace') {
      return l == 'en' ? "TouchID And FaceID" : "สแกนลายนิ้วมือและใบหน้า";
    }
    if (m == 'change') {
      return l == 'en' ? "Change" : "เปลี่ยนภาษา";
    }
    if (m == 'cancel') {
      return l == 'en' ? "Cancel" : "ยกเลิก";
    }
    if (m == 'logOut') {
      return l == 'en' ? "Log Out" : "ออกจากระบบ";
    }
    if (m == 'application') {
      return l == 'en' ? "Application" : "ข้อมูลแอปพลิเคชัน";
    }
    if (m == 'version') {
      return l == 'en' ? "Version" : "เวอร์ชัน";
    }
    if (m == 'mobile') {
      return l == 'en' ? "Mobile" : "ข้อมูลมือถือ";
    }
    if (m == 'platform') {
      return l == 'en' ? "Platform" : "ระบบปฏิบัติการ";
    }
    if (m == 'model') {
      return l == 'en' ? "Model" : "ประเภท";
    }

    if (m == 'changePin') {
      return l == 'en' ? "Change Pin" : "เปลี่ยน PIN CODE";
    }
    if (m == 'changePindesc') {
      return l == 'en' ? "Change Pin" : "ปรับปรุงรหัส PIN CODE";
    }
    if (m == 'forgotPassword1') {
      return l == 'en' ? "Forgot password" : "ลืมรหัสผ่าน";
    }
    if (m == 'forgotPassworddesc') {
      return l == 'en' ? "Change Pin" : "กรณีลืมรหัสผ่าน";
    }
    if (m == 'forgotPassword') {
      return l == 'en' ? "Forgot password" : "ลืมรหัสผ่าน";
    }
    if (m == 'deactivate') {
      return l == 'en' ? "Deactivate" : "ลงชื่อออกจากระบบ";
    }
    if (m == 'deactivatedesc') {
      return l == 'en' ? "Deactivate" : "ลงชื่อออกจากอุปกรณ์";
    }

    if (m == 'changePinDetail') {
      return l == 'en'
          ? "To change the PIN CODE, you must first enter the old password. And then change to the new code you need"
          : "การเปลี่ยน PIN CODE ท่านจะต้องใส่รหัสผ่านของเก่าก่อน แล้วจึงเปลี่ยนเป็นรหัสใหม่ที่ท่านต้องการ";
    }
    if (m == 'forgotPasswordDetail') {
      return l == 'en'
          ? "Making this menu, the system will delete all of your PIN CODE. You must finish changing the password and then set the new PIN CODE of access."
          : "การทำเมนูนี้ ระบบจะทำการลบ PIN CODE ของท่านออกทั้งหมด ท่านต้องทำการเปลี่ยนรหัสผ่านให้เสร็จแล้วมาตั้ง PIN CODE ของการเข้าใช้งานใหม่";
    }
    if (m == 'deactivateDetail') {
      return l == 'en'
          ? "Termination menu The system will delete All of your Mobile App settings If you want to use the App, you must sign in again."
          : "เมนูลงชื่อออกจากระบบ ระบบจะทำการลบข้อมูลการตั้งค่าของ Application ทั้งหมด ถ้าต้องการเข้าใช้งาน Application ท่านจะต้องทำการลงชื่อเข้าใช้งานใหม่";
    }

    if (m == 'yes') {
      return l == 'en' ? "Yes" : "ใช่";
    }
    if (m == 'no') {
      return l == 'en' ? "No" : "ไม่ใช่";
    }
    if (m == 'youWant') {
      return l == 'en' ? "You want " : "ท่านต้องการ ";
    }
    if (m == 'yesOrNo') {
      return l == 'en' ? "Yes or No" : "ใช่ หรือ ไม่";
    }
    if (m == 'adjustFontSize') {
      return l == 'en' ? "Adjust font size" : "ขนาดตัวอักษร";
    }
    if (m == 'small') {
      return l == 'en' ? "Small" : "เล็ก";
    }
    if (m == 'normal') {
      return l == 'en' ? "Normal" : "ปกติ";
    }
    if (m == 'large') {
      return l == 'en' ? "Large" : "ใหญ่";
    }
    if (m == 'fontsize') {
      return l == 'en' ? "Font Size" : "ขนาดตัวอักษร";
    }
    if (m == 'select') {
      return l == 'en' ? "Select" : "เลือก";
    }
    if (m == 'save') {
      return l == 'en' ? "Save" : "บันทึก";
    }
    if (m == 'selectfont') {
      return l == 'en' ? "Please select a font size" : "กรุณาเลือกขนาดตัวอักษร";
    }
  }

  static pinLg(m, l) {
    if (m == 'pinCode') {
      return l == 'en' ? "Please enter the PIN CODE" : "กรุณาใส่ PIN CODE";
    }
    if (m == 'pleaseTryAgain') {
      return l == 'en'
          ? "Wrong password, please try again"
          : "รหัส PIN ไม่ถูกต้องกรุณาลองใหม่อีกครั้ง";
    }
    if (m == 'originalPINCode') {
      return l == 'en'
          ? "Please enter the original PIN CODE"
          : "กรุณาใส่ PIN CODE เดิม";
    }
    if (m == 'incorrectOriginalPINCode') {
      return l == 'en'
          ? "The original PIN CODE is incorrect"
          : "PIN CODE เดิม ไม่ถูกต้อง";
    }
    if (m == 'setPassword') {
      return l == 'en' ? "Set password" : "กรุณาตั้งรหัส PIN";
    }
    if (m == 'confirmPassword') {
      return l == 'en' ? "Confirm password" : "ยืนยันรหัส PIN";
    }
    if (m == 'confirmPasswords') {
      return l == 'en' ? "Confirm password" : "ยืนยันรหัสผ่าน";
    }
    if (m == 'confirmPleaseTryAgain') {
      return l == 'en'
          ? "Wrong password confirmation. Please try again"
          : "ยืนยันรหัส PIN ไม่ถูกต้องกรุณาลองใหม่อีกครั้ง";
    }
    if (m == 'confirmTouchIDAndFaceID') {
      return l == 'en'
          ? "Confirm activation of TouchID and FaceID"
          : "ยืนยันการเปิดใช้งาน TouchID และ FaceID";
    }
    if (m == 'incorrectconfirmTouchIDAndFaceID') {
      return l == 'en'
          ? "The password was wrong. Please try again"
          : "รหัส PIN เปิดใช้งานผิดโปรดลองอีกครั้ง";
    }
    if (m == 'delete') {
      return l == 'en' ? "Delete" : "ลบ";
    }
    if (m == 'reset') {
      return l == 'en' ? "Reset" : "รีเซ็ต";
    }
    if (m == 'forgot') {
      return l == 'en' ? "Forgot" : "ลืม Pin";
    }
    if (m == 'update') {
      return l == 'en' ? "update" : "อัพเดท";
    }
    if (m == 'yes') {
      return l == 'en' ? "Yes" : "ใช่";
    }
    if (m == 'no') {
      return l == 'en' ? "No" : "ไม่";
    }
    if (m == 'fversion') {
      return l == 'en'
          ? "The application does not support."
          : "แอปพลิเคชัน ไม่สนับสนุน";
    }
    if (m == 'uversion') {
      return l == 'en' ? "Version Update" : "เวอร์ชั่นอัพเดท";
    }
    if (m == 'changedpassword') {
      return l == 'en'
          ? "The password has been changed."
          : "รหัสผ่านมีการเปลี่ยนแปลง";
    }
    if (m == 'changedpasswordlogin') {
      return l == 'en'
          ? "Your password has been changed. You must log in again."
          : "รหัสผ่านของท่านมีการเปลี่ยนแปลงท่านต้องลงชื่อเข้าสู่ระบบใหม่";
    }
    if (m == 'ok') {
      return l == 'en' ? "OK" : "ตกลง";
    }
    // if (m == 'checkapplogin') {
    //   return l == 'en'
    //       ? "Your app has not been accessed for too long. For data security You must Sign in again"
    //       : "แอปพลิเคชันของท่านไม่ได้มีการเข้าใช้นานเกินกำหนด เพื่อความปลอดภัยของข้อมูล ท่านต้องทำการ ลงชื่อเข้าใช้ใหม่";
    // }
    if (m == 'checkapplogin') {
      return l == 'en'
          ? "Your app has not been accessed for too long. For data security You must Sign in again"
          : "เนื่องจากเกิดข้อผิดพลาด กรุณาลงชื่อเข้าใช้ใหม่";
    }
    if (m == 'checkapplogin1') {
      return l == 'en'
          ? "Your app has not been accessed for too long. For data security You must Sign in again"
          : "เนื่องจากไม่ได้มีการเข้าใช้งานเกิน 60 วัน กรุณาลงชื่อเข้าใช้ใหม่";
    }
  }

  static loginLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'memberNumber') {
      return l == 'en' ? "Membership Number" : "เลขทะเบียนสมาชิก";
    }
    if (m == 'memberDetail') {
      return l == 'en'
          ? "Please enter your ${MyClass.lengthmember()}-digit membership registration number"
          : "กรุณาใส่เลขทะเบียนสมาชิก ให้ครบ ${MyClass.lengthmember()} หลัก";
    }
    if (m == 'password') {
      return l == 'en' ? "Password" : "รหัสผ่าน";
    }
    if (m == 'confirmPassword') {
      return l == 'en' ? "Confirm password" : "ยืนยันรหัส PIN";
    }
    if (m == 'pleaseConfirmPassword') {
      return l == 'en'
          ? "Please confirm password"
          : "กรุณากรอกรหัสผ่านให้ตรงกัน";
    }
    if (m == 'pleaseYourpassword') {
      return l == 'en' ? "Please enter your password" : "กรุณาใส่รหัสผ่าน";
    }
    if (m == 'logIn') {
      return l == 'en' ? "Log In" : "เข้าสู่ระบบ";
    }
    if (m == 'memberRegis') {
      return l == 'en' ? "Member registration" : "ลงทะเบียนเปิดใช้งาน";
    }
    if (m == 'newRegis') {
      return l == 'en' ? "New Registration" : "ลงทะเบียนใหม่";
    }
    if (m == 'forgotPassword') {
      return l == 'en' ? "Forgot password" : "ลืมรหัสผ่าน";
    }
    if (m == 'alertlogin') {
      return l == 'en'
          ? "Please check your member registration number and password or the internet"
          : "กรุณาตรวจสอบหมายเลขสมาชิกและรหัสผ่านหรืออินเทอร์เน็ต";
    }
    if (m == 'alertLoginNew') {
      return l == 'en'
          ? "Please check your password or the internet"
          : "กรุณาตรวจสอบรหัสผ่าน";
    }
    // checkregis
    if (m == 'checkMemberRegistration') {
      return l == 'en'
          ? "Please check the member registration number"
          : "กรุณาตรวจสอบเลขทะเบียนสมาชิก";
    }
    if (m == 'checkInformation') {
      return l == 'en' ? "Check information" : "ตรวจสอบข้อมูลสมาชิก";
    }
    if (m == 'cancel') {
      return l == 'en' ? "   Cancel   " : "ยกเลิก";
    }
    // regis and forget
    if (m == 'idCardDetail') {
      return l == 'en'
          ? "Please enter your 13-digit identification number"
          : "กรุณากรอกหมายเลขบัตรประชาชน ให้ครบ 13 หลัก";
    }
    if (m == 'birthDayDetail') {
      return l == 'en'
          ? "Please specify the date of birth in the form 01/01/2563"
          : "กรุณาระบุวันเกิดในรูปแบบปี พ.ศ. เช่น 01 01 2530";
    }
    if (m == 'passwordDetail') {
      return l == 'en'
          ? "Please enter a password, at least 6 digits"
          : "กรุณากำหนดรหัสผ่านตัวอักษรภาษาอังกฤษและตัวเลขรวมอยู่ด้วยอย่างน้อย 6 หลักขึ้นไป";
    }
    if (m == 'passwordAlert') {
      return l == 'en'
          ? "Please enter a password, at least 6 digits"
          : "กรุณาตรวจสอบรหัสผ่าน";
    }
    if (m == 'invalidIDCard') {
      return l == 'en'
          ? "Invalid ID card number"
          : "หมายเลขบัตรประชาชนไม่ถูกต้อง \nกรุณาติดต่อสหกรณ์ฯ";
    }
    if (m == 'phone') {
      return l == 'en' ? "Phone Number" : "เบอร์โทรศัพท์";
    }
    if (m == 'PhoneDetail') {
      return l == 'en'
          ? "Please enter your phone number"
          : "กรุณาใส่เบอร์โทรศัพท์ให้ครบ 10 หลัก";
    }
    if (m == 'invalidConPassword') {
      return l == 'en' ? "Invalid confirmation code" : "รหัสยืนยันไม่ถูกต้อง";
    }
    if (m == 'invalidBirthday') {
      return l == 'en' ? "Invalid birthday" : "วันเกิดไม่ถูกต้อง";
    }
    if (m == 'registrationFailed') {
      return l == 'en' ? "Registration failed" : "ลงทะเบียนไม่สำเร็จ";
    }
    if (m == 'regisok') {
      return l == 'en' ? "Registration" : "ลงทะเบียนสำเร็จ";
    }
    if (m == 'forgetok') {
      return l == 'en' ? "Forget" : "เปลี่ยนรหัสผ่านสำเร็จ";
    }
    if (m == 'passwordChangeUnsuccessful') {
      return l == 'en'
          ? "Password change unsuccessful"
          : "เปลี่ยนรหัสผ่านไม่สำเร็จ";
    }
    if (m == 'save') {
      return l == 'en' ? "   Save   " : "ยืนยัน";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "เลขบัตรประชาชน";
    }
    if (m == 'idCardFormat') {
      return l == 'en' ? "x-xxxx-xxxxx-xx-x" : "x-xxxx-xxxxx-xx-x";
    }
    if (m == 'birthday') {
      return l == 'en' ? "Birthday" : "วันเกิด";
    }
  }

  static tabsLg(m, l) {
    if (m == 'menu') {
      return l == 'en' ? "Menu" : "เมนู";
    }
    if (m == 'address') {
      return l == 'en' ? "Address" : "ติดต่อสหกรณ์ฯ";
    }
    if (m == 'profile') {
      return l == 'en' ? "Profile" : "ข้อมูลส่วนตัว";
    }
    if (m == 'news') {
      return l == 'en' ? "News" : "ข่าวสาร";
    }
  }

  static newsLg(m, l) {
    if (m == 'news') {
      return l == 'en' ? "News" : "ข่าวสารสหกรณ์ฯ";
    }
    if (m == 'Coopnews') {
      return l == 'en' ? "Cooperative news" : "ข่าวประชาสัมพันธ์";
    }
    if (m == 'load') {
      return l == 'en' ? "Load" : "โหลดไฟล์";
    }
    if (m == '') {
      return l == 'en' ? "" : "";
    }
  }

  static addressLg(m, l) {
    if (m == 'address') {
      return l == 'en' ? "Address" : "ติดต่อสหกรณ์ฯ";
    }
  }

  static mainLg(m, l) {
    if (m == 'nodata') {
      return l == 'en' ? "No item" : "ไม่มีรายการ";
    }
  }

  static cremationLg(m, l) {
    if (m == 'cremation') {
      return l == 'en' ? "Cremation:" : "สมาคมฌาปนกิจ:";
    }
  }

  static msgLg(m, l) {
    if (m == 'msg') {
      return l == 'en' ? "Massage" : "ข้อความถึงท่าน";
    }
  }

  static pdpa(m, l) {
    if (m == 'pdpa') {
      return l == 'en'
          ? "Massage"
          : "การสมัครใช้บริการข้อกำหนดและเงื่อนไขการใช้งาน Mobile Application สำหรับสมาชิก";
    }
    if (m == 'pdpaDtail') {
      return l == 'en'
          ? "Massage"
          : "1. Mobile Application ของ${MyClass.company("th")} (สหกรณ์ฯ) เป็นการให้บริการทางเครือข่ายอินเทอร์เน็ต ผ่านระบบและอุปกรณ์เทคโนโลยีในรูปแบบของ Application บนโทรศัพท์มือถือ เพื่ออำนวยความสะดวกให้สมาชิกของสหกรณ์ฯ สมาชิกสามารถทำการตรวจสอบข้อมูลส่วนบุคคล ธุรกรรมทางการเงินที่มีกับสหกรณ์ฯ" +
              "\n " +
              "\n2. การเข้าใช้งานระบบข้อมูลสมาชิกจะต้องทำการสมัครเข้าใช้งานระบบและต้องเป็นสมาชิกของสหกรณ์ฯ เท่านั้น" +
              "\n " +
              "\n3. หากชื่อหรือหมายเลขสมาชิกของท่านได้มีการสมัครใช้งานแล้ว โดยท่านไม่ทราบ หรือไม่ได้ทำการสมัครด้วยตัวท่านเองกรุณาแจ้งเจ้าหน้าที่เพื่อทำการตรวจสอบความถูกต้องต่อไป" +
              "\n " +
              "\n4. เพื่อความปลอดภัยในข้อมูลของท่าน หากสหกรณ์ฯ พบว่ามีบุคคลแอบอ้างใช้งานบัญชีของท่านในการเข้าสู่ระบบสหกรณ์ฯ จะบังคับบุคคลนั้นออกจากระบบ โดยไม่ต้องแจ้งให้ทราบ" +
              "\n " +
              "\n5. หากข้อมูลรายละเอียดของสมาชิกไม่ถูกต้องในระบบแล้วมีข้อสงสัยหรือต้องการทำการเปลี่ยนแปลงปรับปรุงข้อมูลให้สมาชิกติดต่อเจ้าหน้าที่เพื่อทำการแก้ไขปรับปรุงเปลี่ยนแปลงข้อมูลต่อไป"
                  "\n " +
              "\n6. ข้าพเจ้าได้อ่านข้อตกลงดังกล่าวและยินยอมในเงื่อนไขต่างๆที่ทางสหกรณ์ฯ กำหนดไว้รวมถึงที่สหกรณ์ฯ จะได้กำหนดแก้ไขเพิ่มเติมหรือเปลี่ยนแปลงในภายภาคหน้าซึ่งให้ถือเป็นส่วนหนึ่งของเงื่อนไขและข้อกำหนดนี้ด้วยการยืนยันข้อมูล";
    }
    if (m == 'pdpaDtail1') {
      return l == 'en'
          ? "Massage"
          : 'TOT CO-OP  เป็นการให้บริการของ${MyClass.company("th")} ทางเครือข่ายอินเทอร์เน็ต ผ่านระบบและอุปกรณ์เทคโนโลยีในรูปแบบของ Application บนโทรศัพท์มือถือ ซึ่งต่อไปนี้จะเรียกว่า "สอท." เพื่ออำนวยความสะดวกในการตรวจสอบข้อมูลส่วนบุคคล ธุรกรรมทางการเงินต่าง ๆ  แก่สมาชิกของ${MyClass.company("th")}  ซึ่งต่อไปนี้จะเรียกว่า "สมาชิก" ให้สามารถใช้ บริการตรวจสอบข้อมูลส่วนบุคคล และ/หรือการทำธุรกรรมทางการเงิน ใด ๆ ที่ สอท.ได้จัดให้มีขึ้นผ่าน TOT CO-OP  ทั้งที่ สอท. กำหนด ไว้แล้วในขณะนี้และ/หรือที่จะมีขึ้นต่อไปในภายหน้าทุกประการ โดยสมาชิก ตกลงยินยอมผูกพันตามข้อตกลงและเงื่อนไขการใช้บริการ TOT CO-OP ดังต่อไปนี้' +
              '\n' +
              '\n1.เงื่อนไขทั่วไป' +
              '\n   1.1.หากชื่อหรือหมายเลขสมาชิกของสมาชิกได้มีการสมัครใช้งานแล้ว โดยท่านไม่ทราบ หรือไม่ได้ทำการสมัครด้วยตัวท่านเองกรุณาแจ้ง สอท.เพื่อทำการตรวจสอบความถูกต้องต่อไป' +
              '\n   1.2.เพื่อความปลอดภัยในข้อมูลของสมาชิก หาก สอท.พบว่ามีบุคคลแอบอ้างใช้งานบัญชีของ สมาชิกในการเข้าใช้บริการ TOT CO-OP   สอท. จะบังคับบุคคลนั้นออกจากระบบ โดยไม่ต้องแจ้งให้ทราบ' +
              '\n   1.3.หากข้อมูลรายละเอียดของสมาชิกไม่ถูกต้องในระบบแล้วมีข้อสงสัยหรือต้องการทำการเปลี่ยนแปลงปรับปรุงข้อมูลให้สมาชิกติดต่อเจ้าหน้าที่เพื่อทำการแก้ไขปรับปรุงเปลี่ยนแปลงข้อมูลต่อไป' +
              '\n' +
              '\n2.เงื่อนไขการสมัครใช้บริการ' +
              '\n   2.1.สอท.เปิดให้บริการ TOT CO-OP สำหรับสมาชิก สอท.เท่านั้น' +
              '\n   2.2.การสมัครใช้บริการ  TOT CO-OP ของ สอท. สมาชิกต้องใช้บัตรประชาชนและทำการยืนยันตัวตนผ่านหมายเลขโทรศัพท์เคลื่อนที่   รหัส One Time Password (0TP) ' +
              '\n' +
              '\n3.การใช้และการเก็บรักษารหัสประจำตัว' +
              '\n   3.1.ในการ Login เพื่อเข้าใช้บริการ TOT CO-OP ของ สอท. สมาชิกต้องใช้ ข้อมูลทางชีวภาพ เช่น ลายนิ้วมือ ใบหน้า และ/หรือ PIN เป็นเครื่องมือในการ Login และ/หรือ เพื่อใช้บริการต่าง ๆ' +
              '\n   3.2.สมาชิกต้องรักษา PIN ไว้เป็นอย่างดี และเก็บไว้ในที่ปลอดภัยมิให้สูญหาย รวมทั้งเก็บรักษาไว้เป็นความลับเฉพาะตัวของตนเองเท่านั้น โดยไม่เปิดเผยหรือกระทำการใด ๆ ที่อาจทำให้ผู้อื่นทราบรหัสประจำตัว และ/หรือ ข้อมูลส่วนบุคคล ดังกล่าว และสมาชิกต้องไม่ทำให้รหัสประจำตัวและ/หรือข้อมูลส่วนบุคคลดังกล่าวตกอยู่ภายใต้การครอบครองของบุคคลอื่น หากเกิดความเสียหายประการใดจากการสูญหายหรือการเปิดเผยรหัสต่าง ๆ ดังกล่าว หรือจากเหตุอื่นใด  สอท.ไม่จำเป็นต้องรับผิดชอบใด ๆ ทั้งสิ้น ทั้งนี้ สมาชิกสามารถเปลี่ยนแปลงรหัสผ่านของ PIN ได้ด้วยตนเองตลอดเวลา ตามหลักเกณฑ์ เงื่อนไข และ วิธีการตามที่ธนาคารกำหนด โดยไม่ต้องแจ้งให้ สอท.ทราบ' +
              '\n   3.3.ในการใช้บริการทุกครั้ง สมาชิกจะต้องใช้ข้อมูลทางชีวภาพ เช่น ลายนิ้วมือ ใบหน้า และ/หรือ PIN กรณีสมาชิกระบุข้อมูลทางชีวภาพ เช่น ลายนิ้วมือ ใบหน้า และ/หรือ PIN ไม่ถูกต้องตามที่ สอท.กำหนด สอท.จะระงับการใช้บริการ TOT CO-OP  ไว้ชั่วคราวโดยอัตโนมัติและสมาชิกจะไม่สามารถใช้รหัสผู้ใช้งานได้อีก โดยสมาชิก จะต้องปลดล็อคการใช้บริการ เพื่อยกเลิก การระงับการใช้บริการ TOT CO-OP ชั่วคราว โดยสมาชิกจะต้องปฏิบัติตามหลักเกณฑ์ เงื่อนไข และวิธีการตามที่ สอท.กำหนด' +
              '\n   3.4.กรณี สมาชิกลืมรหัสผ่านสมาชิกสามารถรีเซ็ตรหัสผ่าน การใช้บริการใหม่ด้วยตัวเองผ่านการตรวจสอบผ่านระบบยืนยันตัวตน รหัส One Time Password (0TP) ' +
              '\n' +
              '\n4.ความสมบูรณ์ของการใช้บริการ และผลผูกพันของสมาชิก' +
              '\n   4.1.สมาชิกตกลงจะไม่กระทำการใด ๆ อันมีผลให้ สอท. ต้องเข้าร่วมในข้อพิพาทระหว่าง สมาชิก กับบุคคล อื่นใด ซึ่งเกี่ยวเนื่องหรือเกี่ยวข้องกับการให้บริการ TOT CO-OP ตามข้อตกลงฉบับนี้ โดยหากสมาชิกมีข้อต่อสู้ และ/หรือสิทธิเรียกร้องใด ๆ ก็จะไปดำเนินการกับบุคคลอื่นด้วยตนเอง' +
              '\n   4.2.การดำเนินการใด ๆ ผ่านบริการ TOT CO-OP อาทิเช่น การตรวจสอบข้อมูลสมาชิก การโอนเงิน การเบิกใช้ การชำระเงิน และบริการหรืออื่น ๆ ทั้งที่เป็นการกระทำของสมาชิกเอง หรือเป็นการกระทำที่เกิดขึ้นโดยบุคคลอื่น ไม่ว่าโดยประการใดก็ตาม หากได้กระทำไปโดยการใช้ PIN ที่เกี่ยวข้องกับบริการนี้แล้ว สมาชิกตกลงให้ถือว่าเป็นการกระทำที่ถูกต้องสมบูรณ์ของสมาชิกซึ่งมีผลผูกพันสมาชิกเสมือนหนึ่งได้กระทำโดยสมาชิกเอง และสมาชิกยินยอมรับผิดชอบในการกระทำดังกล่าวทุกประการ รวมทั้งให้ถือว่าเป็นการ ที่สมาชิกได้ลงลายมือชื่ออิเล็กทรอนิกส์ให้ไว้แก่สอท.เพื่อเป็นหลักฐานในการดำเนินการผ่าน TOT CO-OP ในครั้งนั้น ๆ โดยถูกต้องสมบูรณ์แล้วและตกลงให้ สอท. สามารถใช้ข้อมูลการดำเนินการดังกล่าวเป็นต้นฉบับเอกสารที่ใช้เป็นพยานหลักฐานในการพิสูจน์ว่าสมาชิกได้ดำเนินการดังกล่าวเพื่อใช้ในการดำเนินการทางกฎหมายได้ทุกประการ โดยสมาชิกไม่ต้องทำหรือลงลายมือชื่อในเอกสารใด ๆ เพื่อเป็นหลักฐานในการนั้นอีก เว้นแต่สอท.จะแจ้งหรือจะมีการกำหนดไว้อย่างชัดเจน และสมาชิกตกลงว่าสอท.ไม่จำต้องรับผิดใด ๆ ในความเสียหายที่เกิดขึ้นจากการกระทำข้างต้นโดยสมาชิกยินยอมรับผิดชอบในความเสียหายที่เกิดขึ้นจากการกระทำดังกล่าวข้างต้นทุกประการ' +
              '\n   4.3.สมาชิกตกลงยินยอมผูกพันและตกลงปฏิบัติตามคู่มือระเบียบและวิธีปฏิบัติของ สอท.และเอกสารใด ๆ  ที่เกี่ยวข้องกับการใช้บริการ TOT CO-OP  ซึ่ง สอท.ได้ส่งหรือประกาศ หรือแจ้งไปยังสมาชิกทั้งที่มีอยู่ ณ ขณะนี้และที่ สอท.จะได้เพิ่มเติมต่อไปนอกจากนี้ คู่มือหรือเอกสารใด ๆ เกี่ยวกับการใช้บริการ TOT CO-OP    ที่ สอท.จะส่ง หรือประกาศ หรือแจ้งเพิ่มเติมต่อไปในภายหน้า ให้ถือว่าเป็นส่วนหนึ่งของข้อตกลงฉบับนี้ด้วย รวมทั้งสมาชิกยินยอมปฏิบัติตามระเบียบและวิธีปฏิบัติของ สอท. และ/หรือข้อกำหนดตามกฎหมายที่เกี่ยวข้อง รวมทั้งจัดทำเอกสารอื่นใดให้แก่ สอท.ตามที่ สอท. และ/หรือทางราชการเป็นผู้กำหนดด้วย' +
              '\n   4.4.ข้อตกลงฉบับนี้รวมถึงข้อกำหนดและเงื่อนไขการใช้บริการ และ/หรือการทำธุรกรรมทางการเงินใด ๆ ที่ สอท.ได้จัดให้มีขึ้นผ่าน TOT CO-OP  ทั้งที่ สอท.กำหนดไว้แล้วในขณะนี้และ/หรือที่จะมีขึ้นต่อไปในภายหน้าทุกประการ       ให้ถือว่าเป็นส่วนหนึ่งของใบคำขอสมัคร/ปรับปรุง/เปลี่ยนแปลงการใช้บริการ  TOT CO-OP และ/หรือคำขอใช้บริการ TOT CO-OP ของ สอท. และข้อตกลงและ/หรือข้อกำหนดและเงื่อนไขดังกล่าวข้างต้นขัดหรือแย้งกันเอง สมาชิกจะต้องปฏิบัติตามคำวินิจฉัยของ สอท. และให้ถือว่าคำวินิจฉัยของ สอท.ดังกล่าวเป็นที่สุด โดยสมาชิกตกลงจะไม่โต้แย้ง และ/หรือ เรียกร้องค่าเสียหายหรือค่าใช้จ่ายใด ๆ ทั้งสิ้นจาก สอท.' +
              '\n' +
              '\n5.การดำเนินการกรณีพบข้อผิดพลาด' +
              '\n   5.1.ในกรณีที่สมาชิกใช้บริการหรือทำธุรกรรมประเภทต่าง ๆ ผ่าน TOT CO-OP แล้วเกิดความบกพร่องผิดพลาดไม่ว่าความบกพร่องผิดพลาดนั้น ๆ จะเกิดขึ้นด้วยเหตุผลประการใดก็ตาม สมาชิกตกลงยินยอมให้ สอท.มีอำนาจทุกประการในการแก้ไขความบกพร่องผิดพลาดให้ถูกต้องตามความเป็นจริง' +
              '\n' +
              '\n6.การระงับการให้บริการ' +
              '\n   6.1.กรณี สอท. ตรวจสอบแล้วปรากฎว่า มีการแก้ไขหรือดัดแปลงโทรศัพท์เคลื่อนที่รวมทั้งระบบของโทรศัพท์เคลื่อนที่ของสมาชิกที่ใช้บริการ TOT CO-OP เช่น การแก้ไขหรือดัดแปลงระบบปฏิบัติการของโทรศัพท์ iPhone (iPhone Operating System:iOS) (ซึ่งเรียกว่า Jailbreaking) หรือ การแก้ไขหรือดัดแปลงระบบปฏิบัติการของโทรศัพท์ที่ใช้ Android (ซึ่งเรียกว่า Rooting) เป็นต้น สอท.มีสิทธิระงับหรือยกเลิกการให้บริการ TOT CO-OP (ไม่ว่าบางส่วนหรือทั้งหมด) ของสมาชิกทันที โดยสอท.ไม่ต้องแจ้งให้สมาชิกทราบล่วงหน้า ทั้งนี้ เพื่อความปลอดภัยในการใช้บริการของสมาชิก และสมาชิกขอสละสิทธิในการเรียกร้องค่าเสียหายใด ๆ จาก สอท.ทุกประการ' +
              '\n   6.2.สอท.มีสิทธิจะไม่ให้บริการ หรือระงับ การให้บริการ (ไม่ว่าบางส่วนหรือทั้งหมด) เมื่อใดก็ได้ โดยแจ้งให้ สมาชิกทราบล่วงหน้าไม่น้อยกว่า 30 วัน เว้นแต่ กรณีที่ สอท.เห็นว่าการดำเนินการตามข้อตกลงและเงื่อนไขการใช้บริการนี้   อาจเป็นการขัดต่อกฎหมาย หรือความสงบเรียบร้อย หรือศีลธรรมอันดีของประชาชน หรือมีพฤติการณ์อันน่าเชื่อว่ามีการใช้บริการหรือการทำรายการในลักษณะ Robot หรือโดยทุจริตหรือโดยมิชอบไม่ว่าประการใด ๆ หรือมีเหตุจำเป็นอื่นใดซึ่งไม่อาจแจ้งล่วงหน้าได้' +
              '\n' +
              '\n7.การรับรองรูปภาพ ชื่อ สัญลักษณ์เครื่องหมายและ/หรือข้อมูลใด ๆ ของ สมาชิก ที่นำมาตั้งค่า' +
              '\n   7.1.สมาชิก รับรองว่ารูปภาพ ชื่อ สัญลักษณ์ เครื่องหมายและ/หรือข้อมูลใด ๆ ของ สมาชิก ที่นำมาตั้งค่าเพื่อแสดงหรือดำเนินการใด ๆ ในการใช้บริการ TOT-CO-OP เป็นทรัพย์สินทางปัญญาของ สมาชิก และ/หรือสมาชิกมีสิทธิโดยชอบในการนำมาใช้เพื่อการดังกล่าว และหากเกิดความเสียหายใด ๆ แก่ สอท.อันเนื่องมาจากการนำรูปภาพ ชื่อ สัญลักษณ์ เครื่องหมายและ/หรือข้อมูลใด ๆ ดังกล่าวมาใช้กับการใช้บริการ TOT CO-OP ผู้ขอใช้บริการตกลงชดใช้ค่าเสียหายที่เกิดขึ้นแก่ สอท.ทั้งสิ้น' +
              '\n' +
              '\n8.การเก็บข้อมูลและเปิดเผยข้อมูลส่วนบุคคลการเก็บข้อมูลและเปิดเผยข้อมูลส่วนบุคคล' +
              '\n   8.1.สมาชิก ตกลงและยอมรับว่า สอท. มีสิทธิส่งและ/หรือเปิดเผยข้อมูลส่วนบุคคล ข้อมูลทางการเงิน และ/หรือข้อมูลใด ๆ ของ สมาชิก ที่ได้ให้ไว้หรือมีอยู่กับ สอท. หรือที่ สอท.ได้รับหรือเข้าถึงจากแหล่งอื่นหรือข้อมูลอื่นใดตามที่หน่วยงานหรือคณะกรรมการที่มีอำนาจตามกฎหมายประกาศกำหนด ให้แก่ หน่วยงาน /องค์กร/นิติบุคคลใด ๆ ที่ สอท.เป็นคู่สัญญาหรือมีความสัมพันธ์ด้วย โดยมีวัตถุประสงค์เพื่อสนับสนุนการให้บริการของ สอท. เช่น การวิเคราะห์ข้อมูล การปรับปรุงบริการ หรือผลิตภัณฑ์ต่าง ๆ ของ สอท. การที่ สอท.จ้างหรือมอบหมายให้บุคคลอื่นดำเนินการแทน (เช่นงานเกี่ยวกับเทคโนโลยีสารสนเทศงานติดต่อสื่อสาร งานติดตามทวงถาม เป็นต้น) สมาชิก ได้อ่านและทำความเข้าใจนโยบายความเป็นส่วนตัวของ สอท.อย่างละเอียดที่  www.tot-coop.com แล้ว' +
              '\n' +
              '\n9.กฎหมายที่ใช้บังคับ' +
              '\n   ข้อตกลงฉบับนี้ให้ใช้บังคับและอยู่ภายใต้กฎหมายไทยและให้ศาลไทยเป็นศาลที่มีเขตอำนาจในการพิจารณาข้อพิพาทที่เกิดขึ้นตามข้อตกลงฉบับนี้' +
              '\n' +
              '\n10.การแก้ไขข้อตกลง' +
              '\n   10.1.สอท.มีสิทธิแก้ไข เปลี่ยนแปลง เพิ่มเติมข้อตกลงและเงื่อนไข ฉบับนี้และรายละเอียดใด ๆ ที่เกี่ยวข้องกับ TOT CO-OP รวมทั้ง ข้อตกลงและเงื่อนไขใด ๆ ที่เกี่ยวข้อง โดย สอท.จะปิดประกาศให้ทราบในที่เปิดเผย ณ ที่ทำการ${MyClass.company("th")} /หรือแจ้งผ่านทางเว็บไซต์ (website) ของ สอท.และ/หรือ Application TOT CO-OP  และ/หรือช่องทางอื่นตามที่ สอท.กำหนด' +
              '\n' +
              '\n11.ข้อตกลงทั่วไป' +
              '\n   11.1ในกรณีที่มีกฎหมาย ประกาศ หรือระเบียบของทางราชการ กำหนดให้ สอท.ต้องเปิดเผยข้อมูล หรือธุรกรรมการเงินของผู้ขอใช้บริการต่อเจ้าหน้าที่หรือหน่วยงานของรัฐ เมื่อ สอท.ได้รับการร้องขอ ผู้ขอใช้บริการตกลงและยอมรับว่า สอท.มีสิทธิเปิดเผยข้อมูล และ/หรือจัดทำรายการเกี่ยวกับการทำธุรกรรมทางการเงินของสมาชิกต่อเจ้าหน้าที่หรือหน่วยงานของรัฐได้ทุกประการ' +
              '\n' +
              '\n12.ข้าพเจ้าได้อ่านข้อตกลงดังกล่าวและยินยอมในเงื่อนไขต่าง ๆที่ สอท.กำหนดไว้รวมถึงที่ สอท.จะได้กำหนดแก้ไขเพิ่มเติมหรือเปลี่ยนแปลงในภายหน้าซึ่งให้ถือเป็นส่วนหนึ่งของเงื่อนไขและข้อกำหนดนี้ด้วยการยืนยันข้อมูล';
    }

    if (m == 'pdpacheckbox') {
      return l == 'en'
          ? "Accept Terms and Conditions."
          : "ยอมรับเงื่อนไขและข้อกำหนด";
    }
    if (m == 'pdpacheckbox') {
      return l == 'en' ? "Accept Terms" : "ยอมรับเงื่อนไข";
    }
    if (m == 'pdpasave') {
      return l == 'en' ? "Accept" : "ยอมรับ";
    }
    if (m == 'pdpacancel') {
      return l == 'en' ? "UnAccept" : "ไม่ยอมรับ";
    }
    if (m == 'alertpdpa') {
      return l == 'en'
          ? "Please Accept the Terms and Conditions."
          : "กรุณายอมรับเงื่อนไขและข้อกำหนด";
    }
  }

  static other(m, l) {
    if (m == 'printstatement') {
      return l == 'en' ? "printstatement" : "พิมพ์ statement";
    }
    if (m == 'select') {
      return l == 'en' ? "Select" : "เลือก";
    }
    if (m == 'names') {
      return l == 'en' ? "name" : "ชื่อไม่ถูกต้อง";
    }
    if (m == 'lase_names') {
      return l == 'en' ? "lase_names" : "นามสกุลไม่ถูกต้อง";
    }
  }

  static otp(m, l) {
    if (m == 'headTitleOtp') {
      return l == 'en' ? "OTP" : "ยืนยันรหัส OTP";
    }
    if (m == 'detailOTP') {
      return l == 'en'
          ? "OTP"
          : "กรอกหมายเลขโทรศัพท์ของคุณแล้ว เพื่อรับรหัส OTP \nรหัส จะถูกส่งเข้าไปยังกล่องข้อความในโทรศัพท์ของคุณ";
    }

    if (m == 'submit') {
      return l == 'en' ? "OTP" : "รับรหัส OTP";
    }
  }

  static otpLg(m, l) {
    if (m == 'verification') {
      return l == 'en' ? "OTP Verification" : "การยืนยันหมายเลข OTP";
    }
    if (m == 'otp') {
      return l == 'en' ? "Enter the code sent to " : "ป้อนรหัสที่ส่งไปที่ ";
    }
    if (m == 'time') {
      return l == 'en' ? "Password expires in : " : "รหัสผ่านหมดอายุในอีก : ";
    }
    if (m == 'requestOtp') {
      return l == 'en' ? "Request a new code" : "ขอรหัสใหม่";
    }
  }

  static bank(m, l) {
    if (m == 'bankDetail') {
      return l == 'en'
          ? "Bank"
          : "กรณีสมาชิกโอนเงินฝากให้สหกรณ์ฯ โปรดระบุชื่อบัญชี จำนวนเงินที่ฝาก พร้อมหลักฐานการโอนเงินให้สหกรณ์ฯทราบ เพื่อสหกรณ์ฯจะนำเงินฝากเข้าบัญชีของผู้ฝากเงินได้ถูกต้อง";
    }
  }
}
