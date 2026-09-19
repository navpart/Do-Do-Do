page 70523 "Sales Custom Doc"
{
    PageType = ListPart;
    SourceTable = 70072;
    Caption = 'Custom Documents';


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Document Link"; Rec."Document Link")
                {
                    ExtendedDatatype = URL;
                    ApplicationArea = All;
                }
                field("Sales Order"; Rec."Sales Order")
                {
                    Editable = false;
                    Enabled = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

