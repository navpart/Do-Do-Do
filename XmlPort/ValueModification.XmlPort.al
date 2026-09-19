xmlport 50158 "Value  Modification"
{
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(Table2000000026; Integer)
            {
                AutoSave = false;
                XmlName = 'Integer';
                SourceTableView = SORTING (Number)
                                  WHERE (Number = CONST (1));
                textelement(serialno)
                {
                    XmlName = 'Serial';
                }
                textelement(description)
                {
                    XmlName = 'Description';
                }
                textelement(ItemNo)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    //ValueEntry.GET(EntryNo);
                    //ValueEntry."Sales Amount (Actual)" := 0;
                    //ValueEntry."Cost Amount (Expected)" := 0;
                    ////EVALUATE(ValueEntry."Cost per Unit", CostAmount);
                    ////EVALUATE(ValueEntry."Cost Amount (Actual)", CostAmount);
                    ////EVALUATE(ValueEntry."Cost Posted to G/L", CostAmount);
                    //ValueEntry.MODIFY;

                    ValueEntry.SETRANGE(Chassis, SerialNo);
                    IF ValueEntry.FINDFIRST THEN BEGIN
                        REPEAT
                            ValueEntry.Description := Description;
                            ValueEntry."Item No." := ItemNo;
                            ValueEntry.MODIFY;
                        UNTIL ValueEntry.NEXT = 0;
                    END;
                    MESSAGE('Done!')
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        ValueEntry: Record 5802;
}

