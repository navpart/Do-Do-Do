xmlport 50002 "Export Item Ledger Entry"
{
    Direction = Export;
    Format = VariableText;
    Caption = 'Export Item Ledger Entry';
    Permissions = tabledata "Item Ledger Entry" = r;
    UseRequestPage = true;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(ItemLedgerEntry; "Item Ledger Entry")
            {
                XmlName = 'ModifyILE';
                SourceTableView = SORTING("Entry No.");
                RequestFilterFields = "Entry No.";

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

                trigger OnAfterGetRecord()
                begin
                    EntryNo := Format(ItemLedgerEntry."Entry No.");
                    ExtColorName := ItemLedgerEntry."Exterior Colour Name";
                    ExtColorCode := ItemLedgerEntry."Exterior Colour Code";
                    InteriorColourName := ItemLedgerEntry."Interior Colour Name";
                    InteriorColourCode := ItemLedgerEntry."Interior Colour Code";
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
}
