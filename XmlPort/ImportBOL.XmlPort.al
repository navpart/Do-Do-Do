xmlport 50068 "Import BOL"
{
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement(Table2000000026; Integer)
            {
                AutoSave = false;
                XmlName = 'Integer';
                SourceTableView = SORTING(Number)
                                  WHERE(Number = CONST(1));
                textelement(SourceID)
                {
                }
                textelement(LocationCode)
                {
                }
                textelement(SourceReF)
                {
                }
                textelement(ItemNo)
                {
                }
                textelement(Description)
                {
                }
                textelement(SerialNo)
                {
                }
                textelement(EngineNo)
                {
                }
                textelement(KeyNo)
                {
                }
                textelement(ExtColourName)
                {
                }
                textelement(ExtColourCode)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    IF ReservEntry2.FINDLAST THEN
                        EntryNo := ReservEntry2."Entry No.";

                    ReservEntry.Positive := TRUE;
                    ReservEntry."Entry No." := EntryNo + 1;
                    ReservEntry.VALIDATE(ReservEntry."Creation Date", TODAY);
                    ReservEntry."Source Type" := 39;
                    ReservEntry."Source Subtype" := 1;
                    ReservEntry."Reservation Status" := ReservEntry."Reservation Status"::Surplus;
                    ReservEntry."Item Tracking" := ReservEntry."Item Tracking"::"Serial No.";
                    ReservEntry."Created By" := USERID;
                    ReservEntry.VALIDATE(ReservEntry."Quantity (Base)", 1);
                    ReservEntry.VALIDATE(ReservEntry.Quantity, 1);
                    ReservEntry."Source ID" := SourceID;
                    EVALUATE(ReservEntry."Source Ref. No.", SourceReF);
                    ReservEntry."Location Code" := LocationCode;
                    ReservEntry."Item No." := ItemNo;
                    ReservEntry.Description := Description;
                    ReservEntry."Serial No." := SerialNo;
                    ReservEntry."Engine No." := EngineNo;
                    ReservEntry."Key No." := KeyNo;
                    ReservEntry."Exterior Colour Name" := ExtColourName;
                    ReservEntry."Interior Colour Code" := ExtColourCode;
                    IF Purline.GET(1, SourceID, SourceReF) THEN BEGIN
                        ReservEntry.Description := Purline.Description;
                        ReservEntry."Exterior Colour Code" := Purline.Colour;
                        ReservEntry."Exterior Colour Name" := Purline."Colour Description";
                        ReservEntry."Location Code" := Purline."Location Code";
                    END;
                    ReservEntry.INSERT;
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
        ReservEntry: Record 337;
        ReservEntry2: Record 337;
        EntryNo: Integer;
        Purline: Record 39;
}

