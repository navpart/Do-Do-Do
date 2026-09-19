page 50092 "Leave Plan Card-1"
{
    ApplicationArea = All;
    caption = 'Leave Plan Card';
    PageType = Card;
    SourceTable = "Leave Plan Lines Rev 2";
    SourceTableView = SORTING("Employee No.", "Leave Period", "Entry Type")
                      WHERE("Entry Type" = filter('PLAN'));

    layout
    {
        area(content)
        {
            group(Plan)
            {
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; EmpREc.GetFullName(Rec."Employee No."))
                {
                    Caption = 'Employee Name';
                }
                field("Leave Period"; Rec."Leave Period")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.VALIDATE("Leave Period", SelectYear);
                    end;
                }
                field("Annual Duration"; Rec."Annual Duration")
                {
                }
                field("Amount Due"; Rec."Amount Due")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Total Leaves Due"; Rec."Total Leaves Due")
                {
                }
                field("Total Compassionate"; Rec."Total Compassionate")
                {
                }
                field("Total Exam"; Rec."Total Exam")
                {
                }
                field("Total Others"; Rec."Total Others")
                {
                }
                field("Total Consuming"; Rec."Total Consuming")
                {
                }
                field(RemainingLeave; Rec.RemainingLeave)
                {
                    Caption = 'Balance Leave to Enjoy';
                }
            }
            group(Duration)
            {
                grid(Control01)
                {
                    GridLayout = Rows;
                    group(Control02)
                    {
                        ShowCaption = false;
                        field("Start Date1"; Rec."Start Date1")
                        {
                            Caption = 'From';
                        }
                        field("End Date1"; Rec."End Date1")
                        {
                            Caption = 'To';
                        }
                        field("No. Days1"; Rec."No. Days1")
                        {
                            Caption = 'No. of Days';
                            Editable = true;
                        }
                    }
                    group(Control03)
                    {
                        ShowCaption = false;
                        field("Start Date2"; Rec."Start Date2")
                        {
                            ShowCaption = false;
                        }
                        field("End Date2"; Rec."End Date2")
                        {
                            ShowCaption = false;
                        }
                        field("No. Days2"; Rec."No. Days2")
                        {
                            Editable = true;
                            ShowCaption = false;
                        }
                    }
                    group(Control04)
                    {
                        ShowCaption = false;
                        field("Start Date3"; Rec."Start Date3")
                        {
                            Caption = 'From';
                            ShowCaption = false;
                        }
                        field("End Date3"; Rec."End Date3")
                        {
                            Caption = 'To';
                            ShowCaption = false;
                        }
                        field("No. Days3"; Rec."No. Days3")
                        {
                            Caption = 'No. of Days';
                            Editable = true;
                            ShowCaption = false;
                        }
                    }
                    group(Control05)
                    {
                        ShowCaption = false;
                        field("Start Date4"; Rec."Start Date4")
                        {
                            Caption = 'From';
                            ShowCaption = false;
                        }
                        field("End Date4"; Rec."End Date4")
                        {
                            Caption = 'To';
                            ShowCaption = false;
                        }
                        field("No. Days4"; Rec."No. Days4")
                        {
                            Caption = 'No. of Days';
                            Editable = true;
                            ShowCaption = false;
                        }
                    }
                }

            }
            group(Admin)
            {
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Registered; Rec.Registered)
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Register")
            {
                Caption = '&Register';
                Image = "Action";

                trigger OnAction()
                begin
                    Rec.RegPlan;
                end;
            }
            action("&Create Annual Leaves Plan")
            {
                Caption = '&Create Annual Leaves Plan';
            }
        }
    }

    var
        GenPCode: Codeunit 50004;
        EmpREc: Record 5200;
        EmpName: Text[100];
        PayRec: Record 50076;
        LRosteRec: Record 50077;
        ActualLeaves: Integer;
        ConSumingLeaves: Integer;
        Annual: Integer;
        RemLeaves: Integer;
        DtFilter: Text[30];
        "Net Total Leaves": Integer;
        LCat: Record 50074;
        LeaveYr: Integer;
        DateRec: Record 2000000007;
        DateForm: Page 50098;
        CurrentYr: Integer;
        LPeTemp: Integer;


    procedure SelectYear(): Integer
    begin
        CLEAR(DateForm);
        CLEAR(DateRec);

        CurrentYr := DATE2DMY(TODAY, 3);
        DateRec.RESET;

        DateRec.FILTERGROUP(7);
        DateRec.SETRANGE(DateRec."Period Type", DateRec."Period Type"::Year);
        DateRec.SETRANGE(DateRec."Period No.", 1900, 9999);
        REPEAT
            DateRec.NEXT;
        UNTIL (DateRec."Period No." = CurrentYr);

        DateRec.FILTERGROUP(0);
        DateForm.SETTABLEVIEW(DateRec);

        IF PAGE.RUNMODAL(PAGE::Date, DateRec) = ACTION::LookupOK THEN BEGIN
            CLEAR(DateForm);
            EXIT(DateRec."Period No.");
        END;

        EXIT(0);
    end;
}

