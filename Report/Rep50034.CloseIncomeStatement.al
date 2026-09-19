namespace AL_TNL.AL_TNL;

using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Finance.GeneralLedger.Journal;

report 50034 "Close Income Statement"
{
    ApplicationArea = All;
    Caption = 'Close Income Statement';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(GLAccount; "G/L Account")
        {
            DataItemTableView = where("Account Type" = const(Posting), "Income/Balance" = const("Income Statement"));
            RequestFilterFields = "No.", "Global Dimension 1 Filter", "Global Dimension 2 Filter";

            trigger OnPreDataItem()
            begin
                if StartDate = 0D then
                    Error('Start Date must be specified.');
                if EndDate = 0D then
                    Error('End Date must be specified.');
                if StartDate > EndDate then
                    Error('Start Date must be before End Date.');
                if JnlTemplateName = '' then
                    Error('Journal Template Name must be specified.');
                if JnlBatchName = '' then
                    Error('Journal Batch Name must be specified.');
                if RetainedEarningsAccNo = '' then
                    Error('Retained Earnings Account must be specified.');

                GenJnlBatch.Get(JnlTemplateName, JnlBatchName);
                GenJnlTemplate.Get(JnlTemplateName);

                GenJnlLine.SetRange("Journal Template Name", JnlTemplateName);
                GenJnlLine.SetRange("Journal Batch Name", JnlBatchName);
                if GenJnlLine.FindLast() then
                    NextLineNo := GenJnlLine."Line No." + 10000
                else
                    NextLineNo := 10000;

                SetFilter("Date Filter", '%1..%2', StartDate, EndDate);
                Window.Open('Processing G/L Account #1##########');
            end;

            trigger OnAfterGetRecord()
            begin
                Window.Update(1, "No.");
                CalcFields("Net Change");

                if "Net Change" = 0 then
                    CurrReport.Skip();

                TotalNetChange += "Net Change";

                GenJnlLine.Init();
                GenJnlLine."Journal Template Name" := JnlTemplateName;
                GenJnlLine."Journal Batch Name" := JnlBatchName;
                GenJnlLine."Line No." := NextLineNo;
                if PostingDate <> 0D then
                    GenJnlLine."Posting Date" := PostingDate
                else
                    GenJnlLine."Posting Date" := EndDate;
                GenJnlLine."Document No." := DocNo;
                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No." := "No.";
                if PostingDescription <> '' then
                    GenJnlLine.Description := PostingDescription
                else
                    GenJnlLine.Description := StrSubstNo('Close Income Stmt. %1', Name);
                GenJnlLine."Source Code" := GenJnlTemplate."Source Code";
                // Reverse the balance: debit balance (positive) gets credit, credit balance (negative) gets debit
                GenJnlLine.Validate(Amount, -"Net Change");
                GenJnlLine.Insert(true);

                NextLineNo += 10000;
                LinesCreated += 1;
            end;

            trigger OnPostDataItem()
            begin
                Window.Close();

                if TotalNetChange <> 0 then begin
                    GenJnlLine.Init();
                    GenJnlLine."Journal Template Name" := JnlTemplateName;
                    GenJnlLine."Journal Batch Name" := JnlBatchName;
                    GenJnlLine."Line No." := NextLineNo;
                    if PostingDate <> 0D then
                        GenJnlLine."Posting Date" := PostingDate
                    else
                        GenJnlLine."Posting Date" := EndDate;
                    GenJnlLine."Document No." := DocNo;
                    GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                    GenJnlLine."Account No." := RetainedEarningsAccNo;
                    if PostingDescription <> '' then
                        GenJnlLine.Description := PostingDescription
                    else
                        GenJnlLine.Description := 'Close Income Stmt. Retained Earnings';
                    GenJnlLine."Source Code" := GenJnlTemplate."Source Code";
                    // Balancing entry: net of all reversed income statement amounts
                    GenJnlLine.Validate(Amount, TotalNetChange);
                    GenJnlLine.Insert(true);
                    LinesCreated += 1;
                end;

                if LinesCreated > 0 then
                    Message('%1 journal line(s) created in batch %2/%3.', LinesCreated, JnlTemplateName, JnlBatchName)
                else
                    Message('No income statement entries found for the specified period.');
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(StartDateField; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                        ToolTip = 'Specifies the start date of the fiscal year period to close.';
                    }
                    field(EndDateField; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
                        ToolTip = 'Specifies the end date of the fiscal year period to close.';
                    }
                    field(DocNoField; DocNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the document number to assign to the closing journal lines.';
                    }
                    field(PostingDateField; PostingDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Posting Date';
                        ClosingDates = true;
                        ToolTip = 'Specifies the posting date for the journal lines. Defaults to End Date if left blank.';
                    }
                    field(PostingDescriptionField; PostingDescription)
                    {
                        ApplicationArea = All;
                        Caption = 'Posting Description';
                        ToolTip = 'Specifies a description for all closing journal lines. Defaults to account name if left blank.';
                    }
                    field(RetainedEarningsAccNoField; RetainedEarningsAccNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Retained Earnings Account';
                        TableRelation = "G/L Account"."No." where("Account Type" = const(Posting), "Income/Balance" = const("Balance Sheet"));
                        ToolTip = 'Specifies the retained earnings G/L account to receive the net closing balance.';
                    }
                    field(JnlTemplateNameField; JnlTemplateName)
                    {
                        ApplicationArea = All;
                        Caption = 'Journal Template Name';
                        TableRelation = "Gen. Journal Template".Name;
                        ToolTip = 'Specifies the general journal template for the closing entries.';
                    }
                    field(JnlBatchNameField; JnlBatchName)
                    {
                        ApplicationArea = All;
                        Caption = 'Journal Batch Name';
                        ToolTip = 'Specifies the journal batch for the closing entries.';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            GenJnlBatchRec: Record "Gen. Journal Batch";
                        begin
                            GenJnlBatchRec.SetRange("Journal Template Name", JnlTemplateName);
                            if Page.RunModal(0, GenJnlBatchRec) = Action::LookupOK then begin
                                JnlBatchName := GenJnlBatchRec.Name;
                                Text := GenJnlBatchRec.Name;
                                exit(true);
                            end;
                        end;
                    }
                }
            }
        }
    }

    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlTemplate: Record "Gen. Journal Template";
        Window: Dialog;
        StartDate: Date;
        EndDate: Date;
        DocNo: Code[20];
        PostingDate: Date;
        PostingDescription: Text[100];
        RetainedEarningsAccNo: Code[20];
        TotalNetChange: Decimal;
        JnlTemplateName: Code[10];
        JnlBatchName: Code[10];
        NextLineNo: Integer;
        LinesCreated: Integer;
}
