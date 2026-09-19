codeunit 50015 Notifier
{
    procedure NotifyUserForReview(DocumentType: Text[50]; DocumentNo: Code[20]; DocumentDescription: Text[250]; DocuLink: Text[1000])
    var
        UserSetup: Record "User Setup";
        SelectedUserID: Code[50];
    begin
        // Select user to notify
        SelectedUserID := SelectUser();

        if SelectedUserID = '' then
            exit;

        // Send notification to selected user (without link)
        SendReviewNotification(SelectedUserID, DocumentType, DocumentNo, DocumentDescription, DocuLink);

        Message('Notification sent to user: %1', SelectedUserID);
    end;

    procedure NotifyUserForReviewWithLink(DocumentType: Text[50]; DocumentNo: Code[20]; DocumentDescription: Text[250]; DocuLink: Text[1000])
    var
        UserSetup: Record "User Setup";
        SelectedUserID: Code[50];
    begin
        // Select user to notify
        SelectedUserID := SelectUser();

        if SelectedUserID = '' then
            exit;

        // Send notification to selected user with document link
        SendReviewNotification(SelectedUserID, DocumentType, DocumentNo, DocumentDescription, DocuLink);

        Message('Notification sent to user: %1', SelectedUserID);
    end;

    local procedure SelectUser(): Code[50]
    var
        UserSetup: Record "User Setup";
        UserSetupList: Page "Users Mail List";
    begin
        UserSetup.Reset();
        if UserSetup.FindSet() then begin
            UserSetupList.SetTableView(UserSetup);
            UserSetupList.LookupMode(true);
            if UserSetupList.RunModal() = Action::LookupOK then begin
                UserSetupList.GetRecord(UserSetup);
                exit(UserSetup."User ID");
            end;
        end;
        exit('');
    end;

    local procedure SendReviewNotification(RecipientUserID: Code[50]; DocumentType: Text[50]; DocumentNo: Code[20]; DocumentDescription: Text[250]; DocuLink: Text[1000])
    var
        UserSetupRec: Record "User Setup";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Subject: Text[250];
        Body: Text;
        RecipientEmail: Text[100];
        RecipientName: Text[100];
        SenderUserSetup: Record "User Setup";
        SenderName: Text[100];
    begin
        // Get recipient details
        if not UserSetupRec.Get(RecipientUserID) then
            exit;

        RecipientEmail := UserSetupRec."E-Mail";
        RecipientName := UserSetupRec.Name;

        if RecipientEmail = '' then begin
            Message('User %1 does not have an email address configured.', RecipientUserID);
            exit;
        end;

        // Get sender details
        if SenderUserSetup.Get(UserId) then
            SenderName := SenderUserSetup.Name
        else
            SenderName := UserId;

        // Construct email subject
        Subject := StrSubstNo('Document Awaiting Review: %1 - %2', DocumentType, DocumentNo);

        // Construct email body
        Body := StrSubstNo('Dear %1,<br/><br/>', RecipientName);
        Body += StrSubstNo('A document has been submitted and is awaiting your review.<br/><br/>');
        Body += StrSubstNo('<b>Document Type:</b> %1<br/>', DocumentType);
        Body += StrSubstNo('<b>Document No.:</b> %1<br/>', DocumentNo);

        if DocumentDescription <> '' then
            Body += StrSubstNo('<b>Description:</b> %1<br/>', DocumentDescription);

        Body += StrSubstNo('<b>Submitted By:</b> %1<br/>', SenderName);
        Body += StrSubstNo('<b>Date:</b> %1<br/>', Format(Today));

        // Add clickable link if available
        if DocuLink <> '' then begin
            Body += '<br/><br/>';
            Body += StrSubstNo('<a href="%1" style="display:inline-block;padding:10px 20px;background-color:#0078d4;color:white;text-decoration:none;border-radius:4px;">Open Document</a>', DocuLink);
            Body += '<br/><br/>';
        end else
            Body += '<br/>';

        Body += 'Please log in to the system to review and take appropriate action.<br/><br/>';
        Body += 'Regards,<br/>';
        Body += 'System Administrator<br/><br/>';
        Body += '<i>This is an automated notification. Please do not reply to this message.</i>';

        // Send email
        EmailMessage.Create(RecipientEmail, Subject, Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure NotifyUserWithCustomMessage(RecipientUserID: Code[50]; Subject: Text[250]; MessageBody: Text)
    var
        UserSetupRec: Record "User Setup";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        RecipientEmail: Text[100];
    begin
        // Get recipient details
        if not UserSetupRec.Get(RecipientUserID) then
            exit;

        RecipientEmail := UserSetupRec."E-Mail";

        if RecipientEmail = '' then begin
            Message('User %1 does not have an email address configured.', RecipientUserID);
            exit;
        end;

        // Send email with custom message
        EmailMessage.Create(RecipientEmail, Subject, MessageBody, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SelectAndNotifyMultipleUsers(DocumentType: Text[50]; DocumentNo: Code[20]; DocumentDescription: Text[250]; DocuLink: Text[1000])
    var
        UserSetup: Record "User Setup";
        TempUserSetup: Record "User Setup" temporary;
        UserSetupList: Page "Users Mail List";
        SelectedUserID: Code[50];
        NotificationCount: Integer;
    begin
        // This procedure allows selecting multiple users for notification
        UserSetup.Reset();
        if not UserSetup.FindSet() then
            exit;

        UserSetupList.SetTableView(UserSetup);
        UserSetupList.LookupMode(true);

        repeat
            if UserSetupList.RunModal() = Action::LookupOK then begin
                UserSetupList.GetRecord(UserSetup);
                if not TempUserSetup.Get(UserSetup."User ID") then begin
                    TempUserSetup := UserSetup;
                    TempUserSetup.Insert();
                    SendReviewNotification(UserSetup."User ID", DocumentType, DocumentNo, DocumentDescription, DocuLink);
                    NotificationCount += 1;
                end;
            end else
                break;
        until false;

        if NotificationCount > 0 then
            Message('Notification sent to %1 user(s).', NotificationCount);
    end;

    procedure SelectAndNotifyMultipleUsersWithLink(DocumentType: Text[50]; DocumentNo: Code[20]; DocumentDescription: Text[250]; DocuLink: Text[1000])
    var
        UserSetup: Record "User Setup";
        TempUserSetup: Record "User Setup" temporary;
        UserSetupList: Page "Users Mail List";
        SelectedUserID: Code[50];
        NotificationCount: Integer;
    begin
        // This procedure allows selecting multiple users for notification with document link
        UserSetup.Reset();
        if not UserSetup.FindSet() then
            exit;

        UserSetupList.SetTableView(UserSetup);
        UserSetupList.LookupMode(true);

        repeat
            if UserSetupList.RunModal() = Action::LookupOK then begin
                UserSetupList.GetRecord(UserSetup);
                if not TempUserSetup.Get(UserSetup."User ID") then begin
                    TempUserSetup := UserSetup;
                    TempUserSetup.Insert();
                    SendReviewNotification(UserSetup."User ID", DocumentType, DocumentNo, DocumentDescription, DocuLink);
                    NotificationCount += 1;
                end;
            end else
                break;
        until false;

        if NotificationCount > 0 then
            Message('Notification sent to %1 user(s).', NotificationCount);
    end;

    procedure NotifyUsersFromUserSetupCC(DocumentType: Text[50]; DocumentNo: Code[20]; DocumentDescription: Text[250]; DocuLink: Text[1000]; CCUserEmails: List of [Text])

    var
        UserSetup: Record "User Setup";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Subject: Text[250];
        Body: Text;
        RecipientEmail: Text[100];
        RecipientName: Text[100];
        SenderUserSetup: Record "User Setup";
        SenderName: Text[100];
    begin
        // Get sender details
        if SenderUserSetup.Get(UserId) then
            SenderName := SenderUserSetup.Name
        else
            SenderName := UserId;

        // Construct email subject
        Subject := StrSubstNo('Document Approved: %1 - %2', DocumentType, DocumentNo);

        // Construct email body
        Body := StrSubstNo('Dear sir/ma,<br/><br/>', '');
        Body += StrSubstNo('A document has been submitted and is awaiting your review.<br/><br/>');
        Body += StrSubstNo('<b>Document Type:</b> %1<br/>', DocumentType);
        Body += StrSubstNo('<b>Document No.:</b> %1<br/>', DocumentNo);

        if DocumentDescription <> '' then
            Body += StrSubstNo('<b>Description:</b> %1<br/>', DocumentDescription);

        Body += StrSubstNo('<b>Approved By:</b> %1<br/>', SenderName);
        Body += StrSubstNo('<b>Date:</b> %1<br/>', Format(Today));

        // Send email to each CC recipient
        foreach RecipientEmail in CCUserEmails do begin
            EmailMessage.Create(RecipientEmail, Subject, Body, true);
            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        end;

    end;

}
