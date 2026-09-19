table 70150 "PM/GR Capacity"
{

    fields
    {
        field(1; Year; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Day; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Capacity 8am to 9am"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Capacity 9am to 10am"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Capacity 10am to 11am"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Capacity 11am to 12pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Capacity 12pm to 1pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Capacity 1pm to 2pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Capacity 2pm to 3pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Capacity 3pm to 4pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Capacity 4pm to 5pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Capacity 5pm to 6pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Booking 8am to 9am"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Booking 9am to 10am"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Booking 10am to 11am"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Booking 11am to 12pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Booking 12pm to 1pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Booking 1pm to 2pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Booking 2pm to 3pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Booking 3pm to 4pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Booking 4pm to 5pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Booking 5pm to 6pm"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; Month; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Year, Month, Day)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

