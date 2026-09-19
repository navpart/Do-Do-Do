page 60038 "Tax Relief"
{
    DataCaptionFields = "Relief Code", Name;
    PageType = List;
    SourceTable = "Tax Relief1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Considered; Rec.Considered)
                {
                }
                field("Relief Code"; Rec."Relief Code")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Related E/D"; Rec."Related E/D")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Rate; Rec.Rate)
                {
                }
                field("+ value"; Rec."+ value")
                {
                }
                field(Factor; Rec.Factor)
                {
                }
                field("Added to"; Rec."Added to")
                {
                }
                field("Relief Amount"; Rec."Relief Amount")
                {
                }
                field("Cummulative Relief"; Rec."Cummulative Relief")
                {
                }
                field("Sum Total Relief"; Rec."Sum Total Relief")
                {
                }
                field("Maximum Relief"; Rec."Maximum Relief")
                {
                }
                field(Minimum; Rec.Minimum)
                {
                }
                field("Deduct TaxFree/Before calc"; Rec."Deduct TaxFree/Before calc")
                {
                }
                field("Excess of"; Rec."Excess of")
                {
                }
                field("Relief Base"; Rec."Relief Base")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Tax FreePay")
            {
                Caption = 'Update Tax FreePay';
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Report 50185;
            }
        }
    }

    var
        Employee: Record 5200;
        TaxRelief: Record 50096;
        EdRec: Record 50001;
        PayLineRec: Record 50006;
        PayPeriod: Record 50004;
        PayPeriod2: Record 50004;
        AccPeriod: Record 50;
        AccPeriod2: Record 50;
        AccPercode: Date;
        AccPercode2: Date;
        BeginPer: Code[10];
        EndPer: Code[10];
        EmpGrpLine: Record 50008;
}

