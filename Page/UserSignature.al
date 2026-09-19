namespace AL_TNL.AL_TNL;

using System.Security.User;
using System.Device;
using System.IO;
using System.Text;

page 50087 "User Signature"
{
    Caption = 'Item Category Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "User Setup";
    layout
    {
        area(content)
        {
           /*  field(Picture; Rec.Signature)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the picture that has been inserted for the item Category.';
            } */
        }
    }
    actions
    {
        area(processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';
                Visible = HideActions = FALSE;
                trigger OnAction()
                begin
                  //  ImportFromDevice();
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';
                Visible = HideActions = FALSE;
                trigger OnAction()
                begin
                 //   DeleteItemPicture();
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
       // SetEditableOnPictureActions();
    end;

    var
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: Label 'Select a picture to upload';
        DeleteExportEnabled: Boolean;
        HideActions: Boolean;
        MustSpecifyNameErr: Label 'You must add a description to the item before you can import a picture.';
/*
    procedure TakeNewPicture()
    begin
        Rec.Find();
        Rec.TestField("User ID");
        Rec.TestField(Name);
    end;

    procedure ImportFromDevice()
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
        InStr: InStream;
    begin
        Rec.Find();
        Rec.TestField("User ID");
        if Rec.Name = '' then
            Error(MustSpecifyNameErr);
        if Rec.Signature.Count > 0 then
            if not Confirm(OverrideImageQst) then
                Error('');
        ClientFileName := '';
        UploadIntoStream(SelectPictureTxt, '', '', ClientFileName, InStr);
        if ClientFileName <> '' then
            FileName := FileManagement.GetFileName(ClientFileName);
        //FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
        if FileName = '' then
            Error('');
        Clear(Rec.Signature);
        Rec.Signature.ImportStream(InStr, FileName);
        //Picture.ImportFile(FileName, ClientFileName);
        Rec.Modify(true);
    end;

    local procedure SetEditableOnPictureActions()
    begin
        DeleteExportEnabled := Rec.Signature.Count <> 0;
    end;

    procedure DeleteItemPicture()
    begin
        Rec.TestField("User ID");
        if not Confirm(DeleteImageQst) then
            exit;
        Clear(Rec.Signature);
        Rec.Modify(true);
    end;
*/
}

