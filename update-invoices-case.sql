UPDATE invoices
SET Total = (
    CASE
        WHEN BillingCountry = 'FRANCE' THEN Total + 5
        WHEN BillingCountry = 'USA' THEN Total + 3
        ELSE Total + 1
    END
    )
