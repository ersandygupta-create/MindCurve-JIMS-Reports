pageextension 50203 "E3 Posted Gate Entry Ext" extends "E3Posted Gate Ent Outward List"
{
    actions
    {
        addlast(Processing)
        {
            action(GatePass)
            {
                ApplicationArea = All;
                Caption = 'Gate Pass Outward Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Print the Gate Pass Outward report for the selected posted gate entry.';

                trigger OnAction()
                var
                    GateEntryHeader: Record "E3 Posted Gate Entry Header";
                begin
                    GateEntryHeader.Reset();
                    GateEntryHeader.SetRange("Document No.", Rec."Document No.");

                    if GateEntryHeader.FindFirst() then
                        Report.RunModal(
                            Report::"E3 Gate OutWard Print",
                            true,
                            true,
                            GateEntryHeader)
                    else
                        Error('No posted gate entry found for Document No. %1.', Rec."Document No.");
                end;
            }
        }
    }
}