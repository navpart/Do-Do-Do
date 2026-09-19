page 80028 "Being Serviced"
{
    CardPageID = "Customer Order Card";
    PageType = List;
    SourceTable = "Customer Order HeaderX";
    SourceTableView = WHERE(Stage = filter('Being Serviced'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {

                    trigger OnValidate()
                    begin
                        //IF "JobNo." ==: xRec."No." THEN BEGIN
                        //TechName =: (ClockingSheet."Technician Name");
                        //JobStartDate =: (ClockingSheet."Start Date");
                        //JobClockTime =: (ClockingSheet."Clocked Time");
                        //END;
                    end;
                }
                field("Reception Date"; Rec."Reception Date")
                {
                }
                field("Reception Time"; Rec."Reception Time")
                {
                }
                field("Reception Type"; Rec."Reception Type")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Parts Ordered Date"; Rec."Parts Ordered Date")
                {
                }
                field("Parts Ordered Time"; Rec."Parts Ordered Time")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Estimated Completion Date"; Rec."Estimated Completion Date")
                {
                }
                field("Estimated Completion Time"; Rec."Estimated Completion Time")
                {
                }
                field(Completed; Rec.Completed)
                {
                    Editable = true;
                }
                field(Pending; Rec.Pending)
                {
                    Editable = true;
                }
                field("Current Action"; Rec."Current Action")
                {
                    Editable = true;
                }
                field("Completed Reason"; Rec."Completed Reason")
                {
                    Editable = true;
                }
                field(Technician; Rec.Technician)
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
                field("Job Classification"; Rec."Job Classification")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }

    var
        TechName: Text[50];
        JobStartDate: DateTime;
        JobCloseDate: Duration;
        ClockingSheet: Record 70038;
        "JobNo.": Code[20];
}

