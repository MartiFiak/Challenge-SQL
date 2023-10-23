UPDATE invoices
SET invoices.Total = (
    CASE
        WHEN BillingCountry = 'FRANCE' THEN invoices.Total + 3
        WHEN BillingCountry = 'USA' THEN invoices.Total + 5
        ELSE invoices.Total + 1
    END
    )