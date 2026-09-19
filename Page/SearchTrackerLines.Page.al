page 50116 "Search Tracker Lines"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Lines';
    CardPageID = "Search Tracker Card";
    ModifyAllowed = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Parts Enquiry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part No"; Rec."Part No")
                {
                }
                field("Part Description"; Rec."Part Description")
                {
                }
                field("Stock Type"; Rec."Stock Type")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Variant; Rec.Variant)
                {

                    trigger OnDrillDown()
                    begin
                        GPC.ShowItemAvailFromSearchTracker(Rec, "Item Availability Type"::Variant)
                    end;
                }
                field(Supplied; Rec.Supplied)
                {
                }
                field("Quantity Demanded"; Rec."Quantity Demanded")
                {
                }
                field("Quantity Supplied"; Rec."Quantity Supplied")
                {
                }
                field("Search Code"; Rec."Search Code")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Availability")
            {
                Caption = '&Availability';
                Image = ItemAvailability;
                action(Period)
                {
                    Caption = 'Period';
                    Image = Period;

                    trigger OnAction()
                    begin
                        GPC.ShowItemAvailFromSearchTracker(Rec, "Item Availability Type"::Period)
                    end;
                }
                action(VariantAction)
                {
                    Caption = 'Variant';
                    Image = ItemVariant;

                    trigger OnAction()
                    begin
                        GPC.ShowItemAvailFromSearchTracker(Rec, "Item Availability Type"::Variant)

                    end;
                }
                action(Location)
                {
                    AccessByPermission = TableData 14 = R;
                    Caption = 'Location';
                    Image = Warehouse;

                    trigger OnAction()
                    begin
                        GPC.ShowItemAvailFromSearchTracker(Rec, "Item Availability Type"::Location)
                    end;
                }
            }
            action("&Substitutuion")
            {
                Caption = '&Substitutuion';
                Image = Suggest;
                //Promoted = true;
                //PromotedCategory = Process;
                RunObject = Page 50154;
                RunPageLink = "Substitute No." = FIELD("Part No"), "Location Filter" = FIELD("Location Code");
            }
        }
    }

    var
        ItemAvailFormsMgt: Codeunit 353;
        GPC: codeunit "General Purpose Codeunit-1";
}

