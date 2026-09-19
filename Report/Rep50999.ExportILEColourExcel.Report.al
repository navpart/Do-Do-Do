report 50999 "Export ILE Colour Excel"
{
    Caption = 'Export ILE Colour Excel';
    ProcessingOnly = true;
    UsageCategory = None;
    ApplicationArea = All;

    dataset
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            RequestFilterFields = "Entry No.", "Item No.", "Posting Date", "Location Code";

            trigger OnAfterGetRecord()
            begin
                ExcelBuf.NewRow();
                ExcelBuf.AddColumn(ItemLedgerEntry."Entry No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
                ExcelBuf.AddColumn(ItemLedgerEntry."Exterior Colour Name", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(ItemLedgerEntry."Exterior Colour Code", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(ItemLedgerEntry."Interior Colour Name", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(ItemLedgerEntry."Interior Colour Code", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                }
            }
        }

        actions
        {
            area(processing)
            {
            }
        }
    }

    trigger OnPreReport()
    begin
        ExcelBuf.Reset();
        ExcelBuf.DeleteAll();

        ExcelBuf.NewRow();
        ExcelBuf.AddColumn(EntryNoLbl, false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(ExtColourNameLbl, false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(ExtColourCodeLbl, false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IntColourNameLbl, false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IntColourCodeLbl, false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
    end;

    trigger OnPostReport()
    begin
        ExcelBuf.CreateNewBook(SheetNameLbl);
        ExcelBuf.WriteSheet(SheetNameLbl, CompanyName(), UserId());
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename(FileNameLbl);
        ExcelBuf.OpenExcel();
    end;

    var
        ExcelBuf: Record "Excel Buffer" temporary;
        EntryNoLbl: Label 'Entry No.';
        ExtColourNameLbl: Label 'Exterior Colour Name';
        ExtColourCodeLbl: Label 'Exterior Colour Code';
        IntColourNameLbl: Label 'Interior Colour Name';
        IntColourCodeLbl: Label 'Interior Colour Code';
        SheetNameLbl: Label 'ILE Colour Data';
        FileNameLbl: Label 'ILE_Colour_Data';
}
