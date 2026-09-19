xmlport 50000 "Modify Item Ledger Entry"
{
    Format = VariableText;
    Caption = 'Modify Item Ledger Entry';
    Permissions = tabledata "Item Ledger Entry" = rimd;
    UseRequestPage = true;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(ItemLedgerEntry; "Item Ledger Entry")
            {
                XmlName = 'ModifyILE';
                AutoSave = false;
                SourceTableView = SORTING("Entry No.");

                textelement(EntryNo)
                {

                }
                textelement(ExtColorName)
                {

                }

                textelement(ExtColorCode)
                {

                }
                textelement(InteriorColourName)
                {

                }
                textelement(InteriorColourCode)
                {

                }


                trigger OnBeforeInsertRecord()
                var
                    ItemLedgEntryToUpdate: Record "Item Ledger Entry";
                    EntryNoInt: Integer;

                begin
                    if not Evaluate(EntryNoInt, EntryNo) then begin
                        SkippedCount += 1;
                        CurrXmlPort.Skip();
                        exit;
                    end;

                    if not ItemLedgEntryToUpdate.Get(EntryNoInt) then begin
                        SkippedCount += 1;
                        CurrXmlPort.Skip();
                        exit;
                    end;

                    ItemLedgEntryToUpdate."Exterior Colour Name" := ExtColorName;
                    ItemLedgEntryToUpdate."Exterior Colour Code" := ExtColorCode;
                    ItemLedgEntryToUpdate."Interior Colour Name" := InteriorColourName;
                    ItemLedgEntryToUpdate."Interior Colour Code" := InteriorColourCode;
                    ItemLedgEntryToUpdate.Modify();
                    UpdatedCount += 1;
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
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
    trigger OnPostXmlPort()
    begin
        if UpdatedCount + SkippedCount > 0 then
            Message(ImportSummaryLbl, UpdatedCount, SkippedCount);
    end;

    var
        UpdatedCount: Integer;
        SkippedCount: Integer;
        ImportSummaryLbl: Label 'Import completed. Updated: %1, Skipped: %2.';
}
