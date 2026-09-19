page 50129 "Parts By Model Card"
{
    PageType = Card;
    SourceTable = Model;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Model Description"; Rec."Model Description")
                {
                }
                field("Line Items"; Rec."Line Items")
                {
                }
                field("Line Items with Stock Q'ty"; Rec."Line Items with Stock Q'ty")
                {
                }

                /* field("1.5TIX50"; Rec."1.5TIX50")
                {
                    Caption = 'GRADE I 1.5T';
                    DecimalPlaces = 0 : 0;
                    Visible = ISTIX50;
                    trigger OnValidate()

                    begin
                        ISTIX50 := rec."1.5TIX50" <> 0;
                        CurrPage.UPDATE();
                    end;
                } */
                field("1.5TIX70L"; Rec."1.5TIX70L")
                {
                    Caption = 'GRADE I 1.5T';
                    DecimalPlaces = 0 : 0;
                    Visible = I5TIX70L;
                    trigger OnValidate()

                    begin
                        I5TIX70L := rec."1.5TIX70L" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("1.5TIIX70L"; Rec."1.5TIIX70L")
                {

                    Caption = 'GRADE II 1.5T';
                    DecimalPlaces = 0 : 0;
                    Visible = I5TIIX70L;
                    trigger OnValidate()

                    begin
                        I5TIIX70L := rec."1.5TIIX70L" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("1.6TIIX90P"; Rec."1.6TIIX90P")
                {
                    Caption = 'GRADE II 1.6T';
                    DecimalPlaces = 0 : 0;
                    Visible = I6TIIX90P;
                    trigger OnValidate()

                    begin
                        I6TIIX90P := rec."1.6TIIX90P" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("1.5TIIIX70L"; Rec."1.5TIIIX70L")
                {
                    Caption = 'GRADE III 1.5T';
                    DecimalPlaces = 0 : 0;
                    Visible = I5TIIIX70L;
                    trigger OnValidate()

                    begin
                        I5TIIIX70L := rec."1.5TIIIX70L" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("1.6TIIIX70PE"; Rec."1.6TIIIX70PE")
                {
                    Caption = 'GRADE III 1.6T';
                    DecimalPlaces = 0 : 0;
                    Visible = I6TIIIX70PE;
                    trigger OnValidate()

                    begin
                        I6TIIIX70PE := rec."1.6TIIIX70PE" <> 0;
                        CurrPage.UPDATE();
                    end;
                }
                field("2.0TIIIX90P"; Rec."2.0TIIIX90P")
                {
                    Caption = 'GRADE III 2.0T';
                    DecimalPlaces = 0 : 0;
                    Visible = IITIIIX90P;
                    trigger OnValidate()

                    begin
                        IITIIIX90P := rec."2.0TIIIX90P" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("1.5TIVX1D"; Rec."1.5TIVX1D")
                {
                    Caption = 'GRADE IV 1.5T';
                    DecimalPlaces = 0 : 0;
                    Visible = I5TIVX1D;
                    trigger OnValidate()

                    begin
                        I5TIVX1D := rec."1.5TIVX1D" <> 0;
                        CurrPage.UPDATE();
                    end;
                }
                field("1.6TIVX70PE"; Rec."1.6TIVX70PE")
                {
                    Caption = 'GRADE IV 1.6T';
                    DecimalPlaces = 0 : 0;
                    Visible = I6TIVX70PE;
                    trigger OnValidate()

                    begin
                        I6TIVX70PE := rec."1.6TIVX70PE" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("2.0TIVX90P"; Rec."2.0TIVX90P")
                {
                    Caption = 'GRADE IV 2.0T';
                    DecimalPlaces = 0 : 0;
                    Visible = IITIVX90P;
                    trigger OnValidate()

                    begin
                        IITIVX90P := rec."2.0TIVX90P" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("1.6TVX1D"; Rec."1.6TVX1D")
                {
                    Caption = 'GRADE V 1.6T';
                    DecimalPlaces = 0 : 0;
                    Visible = I6TVX1D;
                    trigger OnValidate()

                    begin
                        I6TVX1D := rec."1.6TVX1D" <> 0;
                        CurrPage.UPDATE();
                    end;
                }


                field("2.0TPRT2"; Rec."2.0TPRT2")
                {
                    Caption = 'PREMIUM 2.0T';
                    DecimalPlaces = 0 : 0;
                    Visible = IITPRT2;
                    trigger OnValidate()

                    begin
                        IITPRT2 := rec."2.0TPRT2" <> 0;
                        CurrPage.UPDATE();
                    end;
                }
                field("1.5TPRX50"; Rec."1.5TPRX50")
                {
                    Caption = 'PREMIUM 1.5T';
                    DecimalPlaces = 0 : 0;
                    Visible = I5TPRX50;
                    trigger OnValidate()

                    begin
                        I5TPRX50 := rec."1.5TPRX50" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("2.0TLUXT2"; Rec."2.0TLUXT2")
                {
                    Caption = 'LUXURY 2.0T';
                    DecimalPlaces = 0 : 0;
                    Visible = IITLUXT2;
                    trigger OnValidate()

                    begin
                        IITLUXT2 := rec."2.0TLUXT2" <> 0;
                        CurrPage.UPDATE();
                    end;
                }
                field("1.5TLUX50"; Rec."1.5TLUX50")
                {
                    Caption = 'LUXURY 1.5T';
                    DecimalPlaces = 0 : 0;
                    Visible = I5TLUX50;
                    trigger OnValidate()

                    begin
                        I5TLUX50 := rec."1.5TLUX50" <> 0;
                        CurrPage.UPDATE();
                    end;
                }

                field("Total Qty Sold"; Rec."Total Qty Sold")
                {
                    DecimalPlaces = 0 : 0;
                    Visible = QtyVisible;
                    trigger OnValidate()

                    begin
                        QtyVisible := rec."Total Qty Sold" <> 0;
                        CurrPage.UPDATE();
                    end;
                }
                field("Date Filter2"; Rec."Date Filter2")
                {

                }
            }
            part(Lines; "Parts By Model Lines")
            {
                SubPageLink = "Model Code" = FIELD("Model No."),
                              "Base Date" = FIELD("Date Filter");

                // Automatically sort by "Field X" ascending
                SubPageView = SORTING(Serial) ORDER(Ascending);

            }
        }
        area(factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "Model No." = field("Model No.");
            }
            part(ItemPicture1; "Item Picture")
            {
                ApplicationArea = All;
                Provider = Lines;
                Caption = 'Part Picture';
                SubPageLink = "No." = field("Part No.");

            }
            part(PowerBIReport; "Power BI Embedded Report Part")
            {
                ApplicationArea = All;
                Caption = 'Power BI';
                SubPageLink = Context = field("Model No.");
            }


        }
    }

    actions
    {

        area(processing)
        {
            action("Print List")
            {
                Caption = 'Print List';
                Promoted = true;
                PromotedCategory = Process;
                RunPageOnRec = true;

                trigger OnAction()
                begin
                    modelrec.SETRANGE(modelrec."Model No.", Rec."Model No.");
                    REPORT.RUNMODAL(50161, TRUE, TRUE, modelrec);
                end;
            }
        }

    }

    trigger OnAfterGetRecord()
    begin
        Rec.VALIDATE("Date Filter", TODAY);

    end;

    trigger OnOpenPage()
    var

    begin


        QtyVisible := Rec."Total Qty Sold" <> 0;
        QtyVisibleI := Rec."Grade I" <> 0;
        QtyVisibleII := Rec."Grade II" <> 0;
        QtyVisibleIII := Rec."Grade III" <> 0;
        QtyVisibleIV := Rec."Grade IV" <> 0;
        QtyVisibleV := Rec."Grade V" <> 0;
        QtyVisiblePRE := Rec."PREMIUM QTY" <> 0;
        QtyVisibleLUX := Rec."LUXURY QTY" <> 0;
        //ISTIX50 := Rec."1.5TIX50" <> 0;
        I5TIIX70L := Rec."1.5TIIX70L" <> 0;
        I5TIX70L := Rec."1.5TIX70L" <> 0;
        I6TIIX90P := Rec."1.6TIIX90P" <> 0;
        I5TIIIX70L := Rec."1.5TIIIX70L" <> 0;
        I6TIIIX70PE := Rec."1.6TIIIX70PE" <> 0;
        IITIIIX90P := Rec."2.0TIIIX90P" <> 0;
        I5TIVX1D := Rec."1.5TIVX1D" <> 0;
        I6TIVX70PE := Rec."1.6TIVX70PE" <> 0;
        IITIVX90P := Rec."2.0TIVX90P" <> 0;
        I6TVX1D := Rec."1.6TVX1D" <> 0;
        IITPRT2 := Rec."2.0TPRT2" <> 0;
        I5TPRX50 := Rec."1.5TPRX50" <> 0;
        IITLUXT2 := Rec."2.0TLUXT2" <> 0;
        I5TLUX50 := Rec."1.5TLUX50" <> 0;


    end;


    var
        modelrec: Record 50014;
        showQsales3: Boolean;
        QtyVisible: Boolean;
        QtyVisibleI: Boolean;

        QtyVisibleII: Boolean;

        QtyVisibleIII: Boolean;

        QtyVisibleIV: Boolean;

        QtyVisibleV: Boolean;

        QtyVisiblePRE: Boolean;

        QtyVisibleLUX: Boolean;
        ISTIX50: Boolean;
        I5TIX70L: Boolean;
        I5TIIX70L: Boolean;
        I5TIIX70PE: Boolean;
        I6TIIX90P: Boolean;
        I5TIIIX70L: Boolean;
        I6TIIIX70PE: Boolean;
        IITIIIX90P: Boolean;
        I5TIVX1D: Boolean;
        I6TIVX70PE: Boolean;
        I6TIVX90P: Boolean;
        IITIVX90P: Boolean;
        I6TVX1D: Boolean;
        IITPRT2: Boolean;
        I5TPRX50: Boolean;
        IITLUXT2: Boolean;
        I5TLUX50: Boolean;




}

