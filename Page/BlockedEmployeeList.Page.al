page 70514 "Blocked Employee List"
{
    Caption = 'Blocked Employee List';
    CardPageID = "Employee Card";
    Editable = false;
    PageType = List;
    SourceTable = "Employee";
    SourceTableView = WHERE(Blocked = filter('Yes'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                }
                field(FullName; Rec.FullName)
                {
                    Caption = 'Full Name';
                }
                field("First Name"; Rec."First Name")
                {
                    Visible = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Visible = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Visible = false;
                }
                field(Grade; Rec.Designation)
                {
                }
                field(Designation; Rec.Grade)
                {
                }
                field(Initials; Rec.Initials)
                {
                    Visible = false;
                }
                field("Annual Leave Duration"; Rec."Annual Leave Duration")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                    Visible = false;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    Visible = false;
                }
                field(Extension; Rec.Extension)
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                    Visible = false;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                }
                field(Bank; Rec.Bank)
                {
                }
                field("Bank Account"; Rec."Bank Account")
                {
                }
                field(Qualification; Rec.Qualification)
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field("Birth Date"; Rec."Birth Date")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Employment Date"; Rec."Employment Date")
                {
                }
                field("Employment Month"; Rec."Employment Month")
                {
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    Visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Visible = false;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    Visible = false;
                }
                field("Search Name"; Rec."Search Name")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Inactive Date"; Rec."Inactive Date")
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
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page 5222;
                    RunPageLink = "Table Name" = CONST(Employee),
                                 "No." = FIELD("No.");
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page 540;
                        RunPageLink = "Table ID" = CONST(5200),
                                      "No." = FIELD("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData 348 = R;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction()
                        var
                            Employee: Record 5200;
                            DefaultDimMultiple: Page 542;
                        begin
                            CurrPage.SETSELECTIONFILTER(Employee);
                            DefaultDimMultiple.SetMultiEmployee(Employee);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                action("&Picture")
                {
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page 5202;
                    RunPageLink = "No." = FIELD("No.");
                }
                action("&Alternative Addresses")
                {
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page 5204;
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("&Relatives")
                {
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page 5209;
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Mi&sc. Article Information")
                {
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page 5219;
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Co&nfidential Information")
                {
                    Caption = 'Co&nfidential Information';
                    Image = Lock;
                    RunObject = Page 5221;
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Q&ualifications")
                {
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page 5206;
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("A&bsences")
                {
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page 5211;
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                separator(Control2)
                {
                }
                action("Absences by Ca&tegories")
                {
                    Caption = 'Absences by Ca&tegories';
                    Image = AbsenceCategory;
                    RunObject = Page 5226;
                    RunPageLink = "No." = FIELD("No."),
                                  "Employee No. Filter" = FIELD("No.");
                }
                action("Misc. Articles &Overview")
                {
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page 5228;
                }
                action("Con&fidential Info. Overview")
                {
                    Caption = 'Con&fidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page 5229;
                }
            }
        }
        area(processing)
        {
            action("Absence Registration")
            {
                Caption = 'Absence Registration';
                Image = Absence;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 5212;
            }
        }
    }
}

