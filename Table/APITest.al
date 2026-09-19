table 50184 "API Test"
{
    Caption = 'API Test';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Approve; Boolean)
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin

                UserSetup.get(USERID);
                Approver := UserSetup.Name;
                CallAPI.OnlineOrderingStatus(DocNo, 'Logistics', Rec.Approver);

            end;
        }
        field(3; Approver; Text[50])
        {
            Caption = 'Approver';
        }
        field(4; DocNo; Code[30])
        {
            Caption = 'DocNo';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        UserSetup: Record "User Setup";
        CallAPI: Codeunit "Call API";
}
