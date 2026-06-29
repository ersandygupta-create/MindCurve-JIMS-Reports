pageextension 50204 "E3 Posted Gate Entry In Ext" extends "E3 Posted Gate Ent Inward List"
{
    actions
    {
        addlast(Processing)
        {
            action(GatePassInward)
            {
                ApplicationArea = All;
                Caption = 'Gate Pass Inward Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Print the Gate Pass Inward report for the selected posted gate entry.';

                trigger OnAction()
                var
                    GateEntryHeader: Record "E3 Posted Gate Entry Header";
                begin
                    GateEntryHeader.Reset();
                    GateEntryHeader.SetRange("Posted Entry No.", Rec."Posted Entry No.");

                    if GateEntryHeader.FindFirst() then
                        Report.RunModal(
                            Report::"E3 Gate In Print",
                            true,
                            true,
                            GateEntryHeader)
                    else
                        Error('No posted gate entry found for Document No. %1.', Rec."Posted Entry No.");
                end;
            }
        }
    }
}