pageextension 50016 "Sales Credit Memo Ext" extends "Sales Credit Memo"
{
    layout
    {
        modify("Reason Code")
        {
            Visible = true;
        }


        addbefore("Credit Memo Details")
        {

            group(Approval)
            {
                field("1st Approval to"; Rec."1st Approval to")
                {
                    Caption = '1st Approval To';
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IF Rec."Shortcut Dimension 1 Code" = '09MARKET' THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3|%4', 'BRANO', 'OLAMIDE', 'GRACE', 'ADERONKE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval to" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                            END;
                        END;

                        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'NDEFECTIVE') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'RAVINDER', 'GOC');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval to" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'DEFECTIVE') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2', 'RAVINDER', 'GOC');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval to" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'ERROR') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3|%4', 'RAVINDER', 'AKEEM', 'GOC', 'Nishant');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."1st Approval to" := UserSetup."User ID";
                                Rec."1st Approver" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                    end;
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Sender; Rec.Sender)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    Caption = 'Send';
                    ApplicationArea = All;
                }
            }
            group("Level 1")
            {
                field("2nd Approval to"; Rec."2nd Approval to")
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IF Rec."Shortcut Dimension 1 Code" = '09MARKET' THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3|%4', 'BAYO', 'AKINMUTIMI', 'SUNDAY');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."2nd Approval to" := UserSetup."User ID";
                                Rec."2nd Approver" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                            END;
                        END;

                        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'NDEFECTIVE') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3', 'BRANO', 'OLAMIDE', 'GRACE', 'ADERONKE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."2nd Approval to" := UserSetup."User ID";
                                Rec."2nd Approver" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'DEFECTIVE') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3', 'BAMIDELE', 'GODWIN', 'GRACE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."2nd Approval to" := UserSetup."User ID";
                                Rec."2nd Approver" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'ERROR') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3', 'BRANO', 'OLAMIDE', 'GRACE', 'ADERONKE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."2nd Approval to" := UserSetup."User ID";
                                Rec."2nd Approver" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                    end;
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    Caption = 'Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("1st Apprv. Status"; Rec."1st Apprv. Status")
                {
                    Caption = '1st Approval Action';
                    ApplicationArea = All;
                }
                field("1st Approval Time"; Rec."1st Approval Time")
                {
                    Caption = 'Approval Time';
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Level 2")
            {
                field("Final Approval to"; Rec."Final Approval to")
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IF (Rec."Shortcut Dimension 1 Code" = '05PARTS') AND (Rec."Reason Code" = 'DEFECTIVE') THEN BEGIN
                            UserSetup.SETFILTER("User ID", '%1|%2|%3|%4', 'BRANO', 'OLAMIDE', 'GRACE', 'ADERONKE');
                            IF PAGE.RUNMODAL(0, UserSetup) = ACTION::LookupOK THEN BEGIN
                                Rec."Final Approval to" := UserSetup."User ID";
                                Rec."Final Approver's Name" := UserSetup.Name;
                                Rec."Current pending Person" := UserSetup."User ID";
                            END;
                        END;
                    end;
                }
                field("Final Approver's Name"; Rec."Final Approver's Name")
                {
                    ApplicationArea = All;
                }
                field("2nd Apprv. Status"; Rec."2nd Apprv. Status")
                {
                    Caption = '2nd Approval Action';
                    ApplicationArea = All;
                }
                field("2nd Approval Time"; Rec."2nd Approval Time")
                {
                    Caption = 'Approval Time';
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Level 3")
            {
                field("Final Apprv. Status"; Rec."Final Apprv. Status")
                {
                    ApplicationArea = All;
                }
                field("Final Approval Time"; Rec."Final Approval Time")
                {
                    ApplicationArea = All;
                }
            }

        }
    }
    var

        UserSetup: Record "User Setup";
}
