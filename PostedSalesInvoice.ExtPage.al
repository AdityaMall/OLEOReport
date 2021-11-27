pageextension 50129 PostedSalesInvoiceExtPage extends "Posted Sales Invoice"
{



    actions
    {
        addfirst(Reporting)
        {
            action(OLEOInvoiceReport)
            {
                Image = Invoice;
                Promoted = true;
                ApplicationArea = All;
                PromotedIsBig = true;
                RunPageOnRec = true;
                PromotedCategory = New;
                RunObject = report "OLEO Report";

                trigger OnAction()
                begin
                    salesInvHeader.Reset();
                    SalesInvHeader.SetRange("No.", rec."No.");
                    IF SalesInvHeader.FINDFIRST THEN BEGIN
                        // OLEOReport.SETTABLEVIEW(SalesInvHeader);
                        report.RunModal(50129, true, false, salesInvHeader);
                    end;
                end;

            }

        }

    }

    var
        salesInvHeader: Record "Sales Invoice Header";
        OLEOReport: Report "OLEO Report";



}