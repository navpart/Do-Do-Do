page 80042 "Fault Material Card"
{
    PageType = Card;
    SourceTable = "Fault Setup Header";
    RefreshOnActivate = true;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Material Cost"; Rec."Material Cost")
                {
                }
                field("Labor Cost"; Rec."Labor Cost")
                {
                }
                field(Price; Rec.Price)
                {
                }
                field("Other Services Cost"; Rec."Other Services Cost")
                {
                }
                field("Other Services Price"; Rec."Other Services Price")
                {
                }
                field("Duration In Days"; Rec."Duration In Days")
                {
                }
                field("Duration In Hours"; Rec."Duration In Hours")
                {
                }
                field("Service KM"; Rec."Service KM")
                {
                }
                field(Estimate; Rec.Estimate)
                {
                }
                field(VAT; Rec.VAT)
                {
                }
                field("Estimate Incl. VAT"; Rec."Estimate Incl. VAT")
                {
                }
            }
            part(Lines; "Fault Material Subform")
            {
                SubPageLink = "Operation code" = field("Operation Code"), "Model No." = field("Model No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Update)
            {
                Caption = 'Update';
                Image = Turnover;
                Promoted = true;

                trigger OnAction()
                begin
                    FaultCode.INIT;
                    FaultCode."Fault Area Code" := Rec."Faulty Area";
                    FaultCode."Symptom Code" := Rec.Symptoms;
                    FaultCode.Code := Rec."Operation Code";
                    FaultCode.Description := Rec.Description;
                    IF FaultCode.INSERT(TRUE) THEN;
                    MESSAGE(Text001);
                end;
            }
        }
    }

    var
        FaultCode: Record 5918;
        Text001: Label 'Fault Code has been updated!';
}

