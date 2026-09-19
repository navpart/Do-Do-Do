page 50128 "Parts By Model Lines"
{
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Parts By Model";
    SourceTableView = SORTING("Model Code", "Part No.", Serial);
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = true;
                field("Model Code"; Rec."Model Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Model Name"; Rec."Model Name")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Part No."; Rec."Part No.")
                {
                }
                field("Part Description"; Rec."Part Description")
                {
                }
                field(TotalSale; Rec.Inv)
                {
                    Caption = 'Total 12 Month Sales';
                    DecimalPlaces = 0 : 0;
                    Visible = TotalSaleVisible;
                }
                field(Avsales; Rec.Avesale)
                {
                    Caption = 'Average Sales of 12 Months';
                    DecimalPlaces = 0 : 0;
                    Visible = AvsalesVisible;
                }
                field("X90 Plus CRUISE"; Rec."X90 Plus Cruise")
                {
                    ApplicationArea = All;
                    Visible = X90PCVisible;
                }
                field("X70 LIBERTY"; Rec."X70 LIBERTY")
                {
                    ApplicationArea = All;
                    Visible = X70LIBVisible;
                }
                field("X70 PHEV"; Rec."X70 PHEV")
                {
                    ApplicationArea = All;
                    Visible = X70PHVisible;
                }
                field("X70 New Body"; Rec."X70 New Body")
                {
                    ApplicationArea = All;
                    Visible = X70NEWBVisibie;
                }
                field("X70 Elegance"; Rec."X70 Plus Elegance")
                {
                    ApplicationArea = All;
                    Visible = X70PEVisible;
                }
                field("DASHING"; Rec."X1 DASHING")
                {
                    ApplicationArea = All;
                    Visible = X1Visible;
                }
                field("T2 TRAVELER"; Rec."T2 TRAVELER")
                {
                    ApplicationArea = All;
                    Visible = T2TRVisible;
                }
                field("T2 PHEV"; Rec."T2 PHEV")
                {
                    ApplicationArea = All;
                    Visible = T2PHVisible;
                }

                field("X50"; Rec."X50")
                {
                    Caption = 'X50';
                    ApplicationArea = All;
                    Visible = X50Visible;

                }
                field("Serial"; Rec."Serial")
                {
                    ApplicationArea = all;
                }
                field("Qty Sold"; Rec."Q'ty Sold")
                {
                }
                field("Sales Rate"; Rec."Sales Rate")
                {
                }
                field("Total Purchase"; Rec."Total Purchase")
                {
                }

                field("Q'ty On Hand"; Rec."Q'ty On Hand")
                {
                }
                field("Q'ty On Purchase Order"; Rec."Q'ty On Purchase Order")
                {
                }
                field("Q'ty On Sales Order"; Rec."Q'ty On Sales Order")
                {
                }
                field("Lost Sales Q'ty"; Rec."Lost Sales Q'ty")
                {
                }
                field("Part Category"; Rec."Part Category")
                {
                }
                field(Comment; Rec.Comment)
                {

                }
                field(Remarks; Rec.Remarks)
                {

                }

            }

        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        AvsalesVisible := FALSE;
        TotalSaleVisible := FALSE;
    end;

    trigger OnOpenPage()
    begin
        AvsalesVisible := FALSE;
        TotalSaleVisible := FALSE;
        UpdateX50Viosibility();
        UpdateX70PHVisible();
        UpdateX70LIBVisible();
        UpdateX70NEWBVisibie();
        UpdateT2TRVisible();
        UpdateT2PHVisible();
        UpdateX90PCVisible();
        UpdateX1Visible();
        UpdateX70PEVisible();
        Rec.SETASCENDING(serial, true); // false for descending
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateX50Viosibility();
        UpdateX70PHVisible();
        UpdateX70LIBVisible();
        UpdateX70NEWBVisibie();
        UpdateT2TRVisible();
        UpdateT2PHVisible();
        UpdateX90PCVisible();
        UpdateX1Visible();
        UpdateX70PEVisible();
    end;


    var
        AvsalesVisible: Boolean;
        TotalSaleVisible: Boolean;
        X50Visible: Boolean;
        X70PHVisible: Boolean;
        X70LIBVisible: Boolean;
        X70NEWBVisibie: Boolean;
        T2TRVisible: Boolean;
        T2PHVisible: Boolean;
        X1Visible: Boolean;
        X70PEVisible: Boolean;
        X90PCVisible: Boolean;



    local procedure UpdateX50Viosibility()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetRange(X50, true);
        X50Visible := PartModel.FindFirst();
    end;

    local procedure UpdateX70PHVisible()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetRange("X70 PHEV", true);
        X70PHVisible := PartModel.FindFirst();
    end;

    local procedure UpdateX70LIBVisible()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetRange("X70 LIBERTY", true);
        X70LIBVisible := PartModel.FindFirst();
    end;

    local procedure UpdateX70NEWBVisibie()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetRange("X70 New Body", true);
        X70NEWBVisibie := PartModel.FindFirst();
    end;

    local procedure UpdateT2TRVisible()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetRange("T2 TRAVELER", true);
        T2TRVisible := PartModel.FindFirst();
    end;

    local procedure UpdateT2PHVisible()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetRange("T2 PHEV", true);
        T2PHVisible := PartModel.FindFirst();
    end;

    local procedure UpdateX90PCVisible()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetFilter("X90 Plus Cruise", '<>%1', '');
        X90PCVisible := PartModel.FindFirst();
    end;

    local procedure UpdateX1Visible()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetFilter("X1 DASHING", '<>%1', '');
        X1Visible := PartModel.FindFirst();
    end;

    local procedure UpdateX70PEVisible()
    var
        PartModel: Record "Parts By Model";
    begin
        PartModel.SetRecFilter();
        PartModel.Copy(Rec);
        PartModel.SetFilter("X70 Plus Elegance", '<>%1', '');
        X70PEVisible := PartModel.FindFirst();
    end;




}

