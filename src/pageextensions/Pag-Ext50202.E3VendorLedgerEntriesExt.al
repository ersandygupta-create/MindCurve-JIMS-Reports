pageextension 50202 "E3 Vend. Ledger Entries" extends "Vendor Ledger Entries"
{
    layout
    {
    }

    actions
    {
        addbefore("&Navigate")
        {
            action("Payment Advice")
            {
                ApplicationArea = All;
                Caption = 'Print Payment Advice';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    IF (Rec."Document Type" = Rec."Document Type"::Payment) OR (Rec."Document Type" = Rec."Document Type"::" ") THEN begin
                        VendorLedgerEntry.Reset();
                        VendorLedgerEntry.SetRange("Document No.", Rec."Document No.");
                        VendorLedgerEntry.SetRange("Vendor No.", Rec."Vendor No.");
                        if VendorLedgerEntry.FindFirst() then
                            Report.RunModal(Report::"E3 Vendor - Payment Advice", true, false, VendorLedgerEntry);
                    end else
                        Error('Please Payment Advice Select only Payment Document !');
                end;
            }
        }
    }


    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
}
