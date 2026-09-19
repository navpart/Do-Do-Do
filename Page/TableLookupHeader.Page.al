page 50010 "Table Lookup Header."
{
    PageType = ListPlus;
    SourceTable = "Payroll-Lookup Header.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(TableId; Rec.TableId)
                {
                    Lookup = false;
                }
                field(Description; Rec.Description)
                {
                }
                field("Search Name"; Rec."Search Name")
                {
                }
                field(Type; Rec.Type)
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Input Factor"; Rec."Input Factor")
                {
                }
                field("Max. Extract Amount"; Rec."Max. Extract Amount")
                {
                }
                field("Rounding Precision"; Rec."Rounding Precision")
                {
                }
                field("Output Factor"; Rec."Output Factor")
                {
                }
                field("Min. Extract Amount"; Rec."Min. Extract Amount")
                {
                    Caption = 'Min. Extract Amount';
                }
                field("Rounding Direction"; Rec."Rounding Direction")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Detail lines")
            {
                Caption = '&Detail lines';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 50011;
                RunPageLink = TableId = FIELD(TableId);
            }
        }
    }
}

