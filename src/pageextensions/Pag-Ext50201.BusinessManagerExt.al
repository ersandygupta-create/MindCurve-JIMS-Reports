pageextension 50201 "E3 Business Manager RC" extends "Business Manager Role Center"
{
    actions
    {
        addbefore(Action39)
        {
            group("E3 Excel Report")
            {
                Caption = 'Excel Report';
                action("Account Ledger Excel")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Ledger';
                    Image = Report;
                    RunObject = report "Account Ledger Report Excel";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Account Ledger action.';
                }
                action("Purchase Tax Register Excel")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Tax Register';
                    Image = Report;
                    RunObject = report "Purchase Tax Register";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Purchase Tax Register action.';
                }
                action("Sales Tax Register Excel")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Tax Register';
                    Image = Report;
                    RunObject = report "Sales Tax Register";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Sales Tax Register action.';
                }
            }
            group("E3 Ledger Report")
            {
                Caption = 'Ledger Report';
                action("Voucher Print-Posted")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Voucher Print New';
                    Image = Report;
                    RunObject = report "Posted Voucher - Post Voucher";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Voucher Print-Posted action.';
                }
                action("Vendor Ledger Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor Ledger Report';
                    Image = Report;
                    RunObject = report "Vendor Ledger Report";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Vendor Ledger Report action.';
                }
                action("Customer Ledger Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Ledger Report';
                    Image = Report;
                    RunObject = report "Customer Ledger Report";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Customer Ledger Report action.';
                }
                action("Bank Reconciliation Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Reconciliation Report';
                    Image = Report;
                    RunObject = report "Print Bank Reconciliatio Rep.";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Bank Reconciliation Report action.';
                }
                action("TDS Register Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'TDS Register Report';
                    Image = Report;
                    RunObject = report "TDS Register Report";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the TDS Register Report action.';
                }
                action("Vendor - Payment Advice")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor - Payment Advice';
                    Image = Report;
                    RunObject = report "E3 Vendor - Payment Advice";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Vendor - Payment Advice action.';
                }
                action("Purchase Order Print")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Order Print';
                    Image = Report;
                    RunObject = report "Purchase Order Print";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Purchase Order Print action.';
                }
                action("TCS Register")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'TCS Register';
                    Image = Report;
                    RunObject = report "TCS Register Report";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the TCS Register action.';
                }
            }
        }
    }

}