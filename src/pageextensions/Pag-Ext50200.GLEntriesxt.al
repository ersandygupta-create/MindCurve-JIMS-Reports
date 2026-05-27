pageextension 50200 "E3 G/L Entries" extends "General Ledger Entries"
{
    layout
    {
    }

    actions
    {
        addafter("Ent&ry")
        {
            action("E3 Print Voucher")
            {
                ApplicationArea = All;
                Caption = 'Print Voucher Dimension';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Print;
                ToolTip = 'Executes the Print Voucher Dimension action.';
                trigger OnAction()
                begin
                    GLEntry.RESET;
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    GLEntry.SETRANGE("Document No.", Rec."Document No.");
                    GLEntry.SETRANGE("Posting Date", Rec."Posting Date");
                    if GLEntry.FindFirst() then
                        REPORT.RUNMODAL(REPORT::"Posted Voucher - Post Voucher", TRUE, TRUE, GLEntry);

                end;
            }
        }


    }
    var
        GLEntry: Record "G/L Entry";
}
