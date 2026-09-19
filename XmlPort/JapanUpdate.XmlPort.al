xmlport 50144 "Japan Update"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement(JapanOrderUpdate; "Japan Order Update")
            {
                XmlName = 'JapanUpdate';
                fieldelement(A; JapanOrderUpdate."Serial No.")
                {
                }
                fieldelement(B; JapanOrderUpdate.TMCINV)
                {
                }
                fieldelement(C; JapanOrderUpdate."Case No")
                {
                }
                fieldelement(D; JapanOrderUpdate."Order No.")
                {
                }
                fieldelement(E; JapanOrderUpdate."Item No.")
                {
                }
                fieldelement(F; JapanOrderUpdate."Part No.")
                {
                }
                fieldelement(G; JapanOrderUpdate."Part Name")
                {
                }
                fieldelement(h; JapanOrderUpdate.Qty)
                {
                }
                fieldelement(i; JapanOrderUpdate."Unit Price")
                {
                }
                fieldelement(j; JapanOrderUpdate.Amount)
                {
                }
                fieldelement(k; JapanOrderUpdate."C/O")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

