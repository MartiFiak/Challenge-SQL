UPDATE invoices
SET Total = (
    CASE
        WHEN BillingCountry = 'FRANCE' THEN Total + 3
        WHEN BillingCountry = 'USA' THEN Total + 5
        ELSE Total + 1
    END
    )
