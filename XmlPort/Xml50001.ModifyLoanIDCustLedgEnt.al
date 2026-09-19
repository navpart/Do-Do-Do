xmlport 50001 "Modify Loan ID Cust. Ledg. Ent"
{
    Caption = 'Modify Loan ID Cust. Ledg. Ent';
    Format = VariableText;
    Permissions = tabledata "Detailed Cust. Ledg. Entry" = rimd;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Integer; "Integer")
            {
                XmlName = 'ModifyLoanID';
                AutoSave = false;
                SourceTableView = SORTING(Number) WHERE(Number = CONST(1));

                textelement(EntryNo)
                {

                }
                textelement(LoanID)
                {

                }

                trigger OnAfterInsertRecord()
                var
                    DetCustLedgerEntry: Record "Detailed Cust. Ledg. Entry";
                begin
                    if DetCustLedgerEntry.Get(EntryNo) then begin
                        DetCustLedgerEntry."Loan ID" := LoanID;
                        DetCustLedgerEntry.Modify();
                    end;
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
