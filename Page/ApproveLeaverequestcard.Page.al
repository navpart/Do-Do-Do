page 50606 "Approve Leave request card"
{
    ApplicationArea = All;
    Editable = false;
    PageType = Card;
    SourceTable = "Leave Request3";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Request No."; Rec."Request No.")
                {

                    trigger OnValidate()
                    begin
                        IF Rec."1st Approval Status" = Rec."1st Approval Status"::Approved THEN
                            ERROR('You cannot change Request no after approval has been made!');
                    end;
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field(Requester; Rec.Requester)
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Employee No."; Rec."Employee No.")
                {
                    trigger OnValidate()
                    begin
                        IF EmpREc.GET(Rec."Employee No.") THEN
                            Rec."Request Type" := EmpREc."Leave Grade";
                    end;
                }
                field("Employee Name"; EmpREc.GetFullName(Rec."Employee No."))
                {
                    Caption = 'Employee Name';
                }
                field("Request Type"; Rec."Request Type")
                {
                    Visible = false;
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {

                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {

                }
                field("Leave Period"; Rec."Leave Period")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec."Leave Period" := SelectYear;
                    end;
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                }
                field("Actual Duration"; Rec."Actual Duration")
                {

                    trigger OnValidate()
                    begin
                        IF NOT (Rec."Leave Category" = 'MATERNITY') AND (Rec."Actual Duration" > 15) THEN
                            ERROR('You cant request more than 15 days Annual Leave at once');
                    end;
                }
                field("Leave Category"; Rec."Leave Category")
                {
                }
                field("Total Leaves Due"; Rec."Total Leaves Due")
                {
                    Visible = false;
                }
                field("Total Consuming"; Rec."Total Consuming")
                {
                    Visible = false;
                }
                field("Total Annual"; Rec."Total Annual")
                {
                    Visible = false;
                }
                field(RemainingLeave; Rec.RemainingLeave)
                {
                    Caption = 'Balance Leave to Enjoy';
                    Editable = false;
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    Caption = 'Send';
                    Editable = "Send for ApprovalEditable";

                    trigger OnValidate()
                    begin
                        Rec.TESTFIELD(Rec."Request Type");
                    end;
                }
                field("Sent Time"; Rec."Sent Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group(Approvals)
            {
                field("1st Approval"; Rec."1st Approval")
                {
                    Caption = 'To';
                    Editable = "1st Approval toEditable";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // HOD
                        IF Rec."Request Type" = Rec."Request Type"::HOD THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\IBIDAPO-OBE', 'TOYOTANIGERIA\KOLAWOLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::HOD1) THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1', 'TOYOTANIGERIA\BUNMI');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        //Manager
                        IF (Rec."Request Type" = Rec."Request Type"::Manager) AND (Rec."Global Dimension 1 code" = '08AUDSYS') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\ADEWUMI', 'TOYOTANIGERIA\AGBESUA');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::Manager) AND (Rec."Global Dimension 1 code" = '09MARKET') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\AJUYAH', 'TOYOTANIGERIA\BAYO');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Request Type" = Rec."Request Type"::Manager) AND (Rec."Global Dimension 1 code" = '05PARTS') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\RAVINDER', 'TOYOTANIGERIA\AKINDELE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::Manager) AND (Rec."Global Dimension 1 code" = '02ADMINHR') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\IBIDAPO-OBE', 'TOYOTANIGERIA\KOLAWOLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Request Type" = Rec."Request Type"::Manager) AND (Rec."Global Dimension 1 code" = '06SERVICE') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3', 'TOYOTANIGERIA\INGALE', 'TOYOTANIGERIA\SYLVESTER', 'TOYOTANIGERIA\BAMIDELE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Request Type" = Rec."Request Type"::Manager) AND (Rec."Global Dimension 1 code" = '03OPLOGIC') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\TOLA', 'TOYOTANIGERIA\RONKE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        //Junior staff - Deputy Manager
                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Global Dimension 1 code" = '08AUDSYS') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\ADEWUMI', 'TOYOTANIGERIA\AGBESUA');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Global Dimension 1 code" = '09MARKET') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\AJUYAH', 'TOYOTANIGERIA\BAYO');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Global Dimension 1 code" = '05PARTS') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\RAVINDER', 'TOYOTANIGERIA\AKINDELE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Global Dimension 1 code" = '02ADMINHR') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\IBIDAPO-OBE', 'TOYOTANIGERIA\KOLAWOLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Global Dimension 1 code" = '06SERVICE') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3', 'TOYOTANIGERIA\INGALE', 'TOYOTANIGERIA\SYLVESTER', 'TOYOTANIGERIA\BAMIDELE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Global Dimension 1 code" = '07FINACC') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\PAA', 'TOYOTANIGERIA\BUNMI');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Global Dimension 1 code" = '04DDEV') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1', 'TOYOTANIGERIA\HENRY');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Global Dimension 1 code" = '03OPLOGIC') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\TOLA', 'TOYOTANIGERIA\RONKE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        //Branch
                        IF Rec."Request Type" = Rec."Request Type"::Branch THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3|%4', 'TOYOTANIGERIA\NISHANT', 'TOYOTANIGERIA\EOT', 'TOYOTANIGERIA\BAYONLE', 'TOYOTANIGERIA\MOSES');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                    end;

                    trigger OnValidate()
                    begin
                        IF NOT (Rec."Leave Category" = 'MATERNITY') AND (Rec."Actual Duration" > 15) THEN
                            ERROR('You cant request more than 15 days Annual Leave at once');
                    end;
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("1st Approval Status"; Rec."1st Approval Status")
                {
                    Caption = 'Action';
                    Editable = "1st Apprv. StatusEditable";

                    trigger OnValidate()
                    begin
                        IF Rec."1st Approval Status" = Rec."1st Approval Status"::Approved THEN BEGIN
                            "2nd Approval toEditable" := FALSE;
                            "Send for ApprovalEditable" := FALSE;
                        END ELSE BEGIN
                            "2nd Approval toEditable" := TRUE;
                            "Send for ApprovalEditable" := TRUE;
                        END;
                        IF Rec."Request Type" = Rec."Request Type"::HOD THEN BEGIN
                            "3rd_Approver_Visible" := FALSE;
                            "3rd_Approver_Visible" := FALSE;
                        END ELSE BEGIN
                            "3rd_Approver_Visible" := TRUE;
                            "3rd_Approver_Visible" := TRUE;
                        END;
                    end;
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group("Level 1")
            {
                Visible = Level_1;
                field("2nd Approval"; Rec."2nd Approval")
                {
                    Caption = 'To';
                    Editable = "2nd Approval toEditable";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IF Rec."Request Type" = Rec."Request Type"::HOD THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1', 'TOYOTANIGERIA\OLAKUNLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."2nd Approval" := UserSetup."User ID";
                                Rec."2nd Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF Rec."Request Type" = Rec."Request Type"::HOD1 THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1', 'TOYOTANIGERIA\IBIDAPO-OBE', 'TOYOTANIGERIA\KOLAWOLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."2nd Approval" := UserSetup."User ID";
                                Rec."2nd Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::Manager) OR (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\IBIDAPO-OBE', 'TOYOTANIGERIA\KOLAWOLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."2nd Approval" := UserSetup."User ID";
                                Rec."2nd Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Request Type" = Rec."Request Type"::Branch) //AND //("Global Dimension 1 code" = '05PARTS')/
                        THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'TOYOTANIGERIA\RAVINDER', 'TOYOTANIGERIA\INGALE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."2nd Approval" := UserSetup."User ID";
                                Rec."2nd Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                    end;
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                }
                field("Send to MD for Approval"; Rec."Send to MD for Approval")
                {
                    Visible = To_Visible;

                    trigger OnValidate()
                    begin
                        IF (Rec."Request Type" = Rec."Request Type"::HOD) OR (Rec."Request Type" = Rec."Request Type"::Manager) OR (Rec."Request Type" = Rec."Request Type"::Branch) THEN
                            ERROR('You cannot send the leave request to the next level');
                    end;
                }
                field("2nd Approval Status"; Rec."2nd Approval Status")
                {
                    Caption = 'Action';
                    Editable = "2nd Apprv. StatusEditable";

                    trigger OnValidate()
                    begin
                        IF Rec."2nd Approval Status" = Rec."2nd Approval Status"::Approved THEN BEGIN
                            "3rd Approval toEditable" := TRUE;
                            "1st Apprv. StatusEditable" := FALSE;
                        END ELSE BEGIN
                            "3rd Approval toEditable" := FALSE;
                            "1st Apprv. StatusEditable" := TRUE;
                        END;
                        IF Rec."Request Type" = Rec."Request Type"::Manager THEN BEGIN
                            "4th_Approver_Visible" := FALSE;
                            "4th_Apprv_Visible" := FALSE
                        END ELSE BEGIN
                            "4th_Approver_Visible" := TRUE;
                            "4th_Apprv_Visible" := TRUE;
                        END;
                    end;
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
            group("Level 2")
            {
                Visible = Level_2;
                field("3rd Approval"; Rec."3rd Approval")
                {
                    Caption = 'To';
                    Editable = "3rd Approval toEditable";
                    Visible = To_Visible;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IF Rec."Request Type" = Rec."Request Type"::Manager THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1', 'TOYOTANIGERIA\OLAKUNLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."3rd Approval" := UserSetup."User ID";
                                Rec."3rd Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF Rec."Request Type" = Rec."Request Type"::HOD1 THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1', 'TOYOTANIGERIA\OLAKUNLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."3rd Approval" := UserSetup."User ID";
                                Rec."3rd Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Send to MD for Approval" = TRUE) THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1', 'TOYOTANIGERIA\OLAKUNLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."3rd Approval" := UserSetup."User ID";
                                Rec."3rd Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Request Type" = Rec."Request Type"::Branch) THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1', 'TOYOTANIGERIA\IBIDAPO-OBE', 'TOYOTANIGERIA\KOLAWOLE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."3rd Approval" := UserSetup."User ID";
                                Rec."3rd Approver" := UserSetup.Name;
                                //"Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                    end;

                    trigger OnValidate()
                    begin
                        IF (Rec."Request Type" = Rec."Request Type"::HOD) OR ((Rec."Request Type" = Rec."Request Type"::"Junior staff - Deputy Manager") AND (Rec."Send to MD for Approval" = FALSE)) THEN
                            ERROR('You can only Appover this Leave Approval Request');
                    end;
                }
                field("3rd Approver"; Rec."3rd Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                    Visible = To_Visible;
                }
                field("3rd Approval Status"; Rec."3rd Approval Status")
                {
                    Caption = 'Action';
                    Editable = "3rd Apprv. StatusEditable";

                    trigger OnValidate()
                    begin
                        IF Rec."3rd Approval Status" = Rec."3rd Approval Status"::Approved THEN BEGIN
                            "4th Approval toEditable" := TRUE;
                            "2nd Apprv. StatusEditable" := FALSE
                        END ELSE BEGIN
                            "4th Approval toEditable" := FALSE;
                            "2nd Apprv. StatusEditable" := TRUE
                        END;
                    end;
                }
                field("3rd  Approval Time"; Rec."3rd  Approval Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        IF (Rec."Send for Approval" = TRUE) THEN
            Level_1 := TRUE;

        IF Rec."1st Approval Status" <> Rec."1st Approval Status"::" " THEN
            Level_2 := TRUE;

        IF (Rec."2nd Approval Status" <> Rec."2nd Approval Status"::" ") THEN
            Level_3 := TRUE;

        IF Rec."Send for Approval" = FALSE THEN
            "1st Approval toEditable" := FALSE
        ELSE
            "1st Approval toEditable" := TRUE;
        IF Rec."1st Approval Status" = Rec."1st Approval Status"::Approved THEN BEGIN
            "2nd Approval toEditable" := FALSE;
            "Send for ApprovalEditable" := FALSE
        END ELSE BEGIN
            "2nd Approval toEditable" := TRUE;
            "Send for ApprovalEditable" := TRUE
        END;
        IF Rec."2nd Approval Status" = Rec."2nd Approval Status"::Approved THEN BEGIN
            "3rd Approval toEditable" := FALSE;
            "1st Apprv. StatusEditable" := FALSE
        END ELSE BEGIN
            "3rd Approval toEditable" := TRUE;
            "1st Apprv. StatusEditable" := TRUE
        END;
        IF Rec."3rd Approval Status" = Rec."3rd Approval Status"::Approved THEN BEGIN
            "4th Approval toEditable" := TRUE;
            "1st Apprv. StatusEditable" := FALSE
        END ELSE BEGIN
            "4th Approval toEditable" := FALSE;
            "1st Apprv. StatusEditable" := TRUE
        END;

        IF Rec."4th  Approval Status" = Rec."4th  Approval Status"::Approved THEN
            "2nd Apprv. StatusEditable" := FALSE
        ELSE
            "2nd Apprv. StatusEditable" := TRUE;

        IF Rec."4th  Approval Status" = Rec."4th  Approval Status"::Approved THEN
            "3rd Apprv. StatusEditable" := FALSE
        ELSE
            "3rd Apprv. StatusEditable" := TRUE;
        IF (Rec."3rd Approval Status" = Rec."3rd Approval Status"::Approved) AND
           ((Rec."Request Type" = Rec."Request Type"::Branch) OR (Rec."Send to MD for Approval")) THEN
            "4th Apprv. StatusEditable" := TRUE
        ELSE
            "4th Apprv. StatusEditable" := TRUE;
        FastTabControl;
        IF Rec."Request Type" = Rec."Request Type"::HOD THEN
            To_Visible := FALSE
        ELSE
            To_Visible := TRUE;
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
        //DateForm: Page "50098";
        CurrentYr: Integer;

        Level_1: Boolean;

        Level_2: Boolean;
        Level_3: Boolean;
        "4th ApprovalVisible": Boolean;

        Level_4: Boolean;

        "No.Editable": Boolean;

        "1st Approval toEditable": Boolean;

        "2nd Approval toEditable": Boolean;

        "Send for ApprovalEditable": Boolean;

        "3rd Approval toEditable": Boolean;
        "4th Approval toEditable": Boolean;

        "1st Apprv. StatusEditable": Boolean;

        "2nd Apprv. StatusEditable": Boolean;

        "Entry DateEditable": Boolean;
        "3rd Apprv. StatusEditable": Boolean;
        "4th Apprv. StatusEditable": Boolean;
        UserSetup: Record 91;
        "4th_Apprv_Visible": Boolean;
        "4th_Approver_Visible": Boolean;
        "3rd_Apprv_Visible": Boolean;
        "3rd_Approver_Visible": Boolean;
        LeaveRegister: Record 70008;
        To_Visible: Boolean;
        Name_Visible: Boolean;
        Send_Visible: Boolean;

    procedure EnableSubFrm()
    begin
        /*
        LCat.RESET;
        IF LCat.GET("Leave Category") AND (LCat."Payment Allowed") THEN
          CurrPage.SubFrm.ENABLED(TRUE)
        ELSE
          CurrPage.SubFrm.ENABLED(FALSE);
         */

    end;

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
        //DateForm.SETTABLEVIEW(DateRec);

        //IF PAGE.RUNMODAL(PAGE::Date, DateRec) = ACTION::LookupOK THEN EXIT(DateRec."Period No.");

        EXIT(0);
    end;

    local procedure FastTabControl()
    begin
        IF Rec."Send for Approval" THEN
            Level_1 := TRUE
        ELSE
            Level_1 := FALSE;

        IF Rec."1st Approval Status" = Rec."1st Approval Status"::Approved THEN
            Level_2 := TRUE
        ELSE
            Level_2 := FALSE;

        IF (Rec."2nd Approval Status" = Rec."2nd Approval Status"::Approved) AND ((Rec."Request Type" = Rec."Request Type"::HOD1) OR (Rec."Request Type" = Rec."Request Type"::Manager) OR
            (Rec."Request Type" = Rec."Request Type"::Branch)) OR (Rec."Send to MD for Approval" = TRUE) THEN
            Level_3 := TRUE
        ELSE
            Level_3 := FALSE;

        //IF ("3rd Approval Status" = "3rd Approval Status"::Approved ) AND (("Request Type" ="Request Type":: Branch) OR ("Send to MD for Approval"))THEN
        //   Level_4:= TRUE
        //ELSE
        //   Level_4:= FALSE;
    end;
}

