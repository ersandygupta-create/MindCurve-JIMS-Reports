report 50030 "E3 Gate Entry Register"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Gate Entry Register';
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("PostedGateEntryHeader"; "E3 Posted Gate Entry Header")
        {
            DataItemTableView = sorting("Posted Entry No.");
            RequestFilterFields = "Entry Type", "Posting Date/Time", "Department Code", "Vendor No.", Status;

            trigger OnPreDataItem()
            begin

            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {

                    // }
                }
            }
        }

        trigger OnInit()
        begin
            blnExportToExcel := true;
        end;

    }

    trigger OnPreReport()
    begin
        if blnExportToExcel then
            MakeExcelInfo;
    end;

    trigger OnPostReport()
    begin
        if blnExportToExcel then
            CreateExcelbook;
    end;


    var
        Text001: Label 'Gate Entry Register';
        ExcelBuf: Record "Excel Buffer" temporary;
        blnExportToExcel: Boolean;
        PostedGateEntryLine: Record "E3 Posted Gate Entry Line";

    procedure MakeExcelInfo()
    begin
        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(PostedGateEntryHeader."Entry Type", false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(PostedGateEntryHeader.PostedNo, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(PostedGateEntryHeader."Document No.", false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(PostedGateEntryHeader."Reference Document No.", false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(PostedGateEntryHeader."Posting Date/Time", false, '', true, false, true, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.AddColumn(PostedGateEntryHeader."Vendor Name", false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(PostedGateEntryHeader."Department Code", false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(PostedGateEntryHeader.Status, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);

    end;

    procedure MakeExcelDataBody()
    begin
        PostedGateEntryLine.Reset();
        PostedGateEntryLine.SetRange("Document No.", PostedGateEntryHeader."Document No.");

        if PostedGateEntryLine.FindSet() then
            repeat
                ExcelBuf.NewRow;
                ExcelBuf.AddColumn(PostedGateEntryLine."Item No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine."Item Name", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine."Unit of Measurement", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine.Quantity, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine."Qty to Receive", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine."Quantity Received", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine."Asset No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine."Serial No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine."Lot No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(PostedGateEntryLine.Remarks, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);

            until PostedGateEntryLine.Next() = 0;
    end;

    procedure CreateExcelbook()
    begin
        ExcelBuf.CreateNewBook(Text001);
        ExcelBuf.WriteSheet(Text001, CompanyName, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename(Text001);
        ExcelBuf.OpenExcel();
    end;

}