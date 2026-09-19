page 70056 "Actual Leave Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Leave Plan Lines Rev 2";


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Serial No"; Rec."Serial No")
                {
                    Editable = false;
                }
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
                        Rec."Leave Period" := SelectYear;
                    end;
                }
                field("Leave Category"; Rec."Leave Category")
                {
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                }
                field("Actual Duration"; Rec."Actual Duration")
                {
                }
                field("Amount Due"; Rec."Amount Due")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Total Consuming"; Rec."Total Consuming")
                {
                }
                field("Total Compassionate"; Rec."Total Compassionate")
                {
                }
                field("Total Annual"; Rec."Total Annual")
                {
                }
                field("Total Exam"; Rec."Total Exam")
                {
                }
                field("Total Leaves Due"; Rec."Total Leaves Due")
                {
                }
                field(RemainingLeave; Rec.RemainingLeave)
                {
                    Caption = 'Balance Leave to Enjoy';
                    Editable = false;
                }
                field(Registered; Rec.Registered)
                {
                    Editable = false;
                }
            }
            part(Lines; "Leave Payment List Rev2")
            {
                SubPageLink = "Leave Plan No." = FIELD("Serial No");
                SubPageView = SORTING("Leave Plan No.", "Entry no");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("&Register")
            {
                Image = "Action";

                trigger OnAction()
                begin
                    Rec.RegisterLeave(Rec."Entry Type");
                end;
            }
            action("&Print Leave Advise")
            {
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    LPlanRec.SETRANGE(LPlanRec."Serial No", Rec."Serial No");
                    LPlanRec.SETRANGE(LPlanRec."Employee No.", Rec."Employee No.");
                    REPORT.RUN(REPORT::"Leave Certificate-Rev2", TRUE, FALSE, LPlanRec);
                end;
            }
            separator(Group)
            {
            }
            action("R&oster")
            {
                Image = "Action";
                RunObject = Page 50055;
                RunPageLink = "Employee No" = FIELD("Employee No.");
            }
            action("Re&verse Leave Entry")
            {
            }
            action(CheckHoliday)
            {
                trigger OnAction()
                var
                    GPC: Codeunit "General Purpose Codeunit-1";
                begin

                    GPC.IsHoliday(Rec."Actual Start Date");
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Entry Type" := Rec."Entry Type"::ACTUAL;
    end;

    var
        GenPCode: Codeunit 50004;
        EmpREc: Record 5200;
        EmpName: Text[60];
        PayRec: Record 50076;
        LRosteRec: Record 50077;
        ActualLeaves: Integer;
        ConSumingLeaves: Integer;
        Annual: Integer;
        RemLeaves: Integer;
        DtFilter: Text[30];
        "Net Total Leaves": Integer;
        LCat: Record 50074;
        LPlanRec: Record 50075;
        LeaveYr: Integer;
        DateRec: Record 2000000007;
        DateForm: Page 50098;
        CurrentYr: Integer;

    procedure SelectYear(): Integer

    begin
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

        IF PAGE.RUNMODAL(PAGE::Date, DateRec) = ACTION::LookupOK THEN EXIT(DateRec."Period No.");

        EXIT(0);
    end;
}

