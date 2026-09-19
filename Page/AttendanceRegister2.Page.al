page 50388 "Attendance Register 2"
{
    PageType = Card;
    SourceTable = "Attendance Register 2";
    SourceTableView = SORTING("TnA ID") WHERE(Status = FILTER('Complete'));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(Filters)
            {
                Caption = 'Filters';
                field(EmployeeNo; EmployeeNo)
                {
                    Caption = 'Employee No.';
                    TableRelation = Employee."No." WHERE(Status = filter('Active'), "Termination Date" = FILTER(''));

                    trigger OnValidate()
                    begin
                        IF EmployeeNo <> '' THEN
                            Rec.SETRANGE("Employee No.", EmployeeNo)
                        ELSE
                            Rec.SETRANGE("Employee No.");
                        /*
                        BEGIN
                        RESET;
                        SETFILTER(Status,'%1',2);
                        SETFILTER("Date In",DateFilter);
                        //CurrForm.UPDATE(FALSE);
                      END;
                         */

                    end;
                }
                field(DateFilter; DateFilter)
                {
                    Caption = 'Date Filter';

                }
                label(Control1)
                {
                    CaptionClass = Text19042460;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
            }
            repeater(Control2)
            {
                Editable = false;
                field("Employee No."; Rec."Employee No.")
                {
                    Editable = false;
                }
                field("TnA ID"; Rec."TnA ID")
                {
                    BlankNumbers = BlankZero;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Schedule Code"; Rec."Schedule Code")
                {
                    Editable = false;
                }
                field("Date In"; Rec."Date In")
                {
                    Editable = false;
                }
                field("Time In"; Rec."Time In")
                {
                    Editable = false;
                }
                field("Date Out"; Rec."Date Out")
                {
                    Editable = false;
                }
                field("Time Out"; Rec."Time Out")
                {
                    Editable = false;
                }
                field("Day Type"; Rec."Day Type")
                {
                    Editable = false;
                }
                field("Overtime Mins"; Rec."Overtime Mins")
                {
                    Editable = false;
                }
                field("Mins At Work"; Rec."Mins At Work")
                {
                    Editable = false;
                }
                field("Minutes Not Worked"; Rec."Minutes Not Worked")
                {
                    Editable = false;
                }
                field(Void; Rec.Void)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnModifyRecord(): Boolean
    begin
        Rec."Entry Type" := 2;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Entry Type" := Rec."Entry Type"::Manual;
    end;

    var
        StartDate: Date;
        EndDate: Integer;
        ScheduleCode: Code[20];
        EmployeeNo: Code[20];
        DateFilter: Text[30];
        Text19042460: Label 'ATTENDANCE REGISTER';
}

