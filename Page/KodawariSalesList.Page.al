page 70070 "Kodawari Sales List"
{
    CardPageID = "Sales Order";
    PageType = List;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = FILTER(Order));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field("Sell-to Post Code"; Rec."Sell-to Post Code")
                {
                    Visible = false;
                }
                field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    Visible = false;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    Visible = false;
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    Visible = false;
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    Visible = false;
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    Visible = false;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    Visible = false;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    Visible = false;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    Visible = false;
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    Visible = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Visible = true;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    Visible = false;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Visible = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
                Visible = false;
            }
            systempart(Notes; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

