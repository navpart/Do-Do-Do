table 50165 Test
{

    fields
    {
        field(1; "No."; Integer)
        {
        }
        field(2; "Take Action"; Option)
        {
            OptionCaption = ' ,Approved,On-hold,Rejected';
            OptionMembers = " ",Approved,"On-hold",Rejected;
            trigger OnValidate()

            var
                CCText: Text;
                Separator: Text;

            begin
                ToAddresses := 'joshua@toyotanigeria.com';
                BccAddresses := '';
                PurchSetUp.Get();

                CcAddresses.Add('joshua@toyotanigeria.com');
                CcAddresses.Add('brano@toyotanigeria.com');
                //CcAddresses := PurchSetUp."CC Account Dept. Approvers".Split(';');

                Subject := 'Test';

                SendEmail(ToAddresses, Subject, '', CcAddresses, '');

            end;

        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }

    }

    var
        PurchSetUp: Record "Purchases & Payables Setup";
        ToAddresses: Text;
        CcAddresses: List of [Text];
        //CCAddress: Text;
        BccAddresses: Text;
        Subject: Text[70];


    procedure CreateEmailBody(DocType: Option; DocNo: Code[20]; BodyMsg: Text; RecipientInitials: Text);

    var

    begin



    end;

    procedure SendEmail(ToRecipients: Text; Subject: Text; Body: Text; CCRecipients: list of [Text]; BCCRecipients: Text)
    var

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    begin

        EmailMessage.Create(ToRecipients, Subject, '', true);

        EmailMessage.SetRecipients(Enum::"Email Recipient Type"::Cc, CCRecipients);

        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Bcc, BCCRecipients);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default)

    end;

    local procedure SplitStringusingCommas()
    var
        SourceText: Text;
        Delimiter: Text;
        Substrings: List of [Text];
        Substring: Text;
    begin
        SourceText := 'apple,banana,cherry';
        Delimiter := ',';

        Substrings := SourceText.Split(Delimiter);

        foreach Substring in Substrings do
            Message(Substring);
    end;

}

