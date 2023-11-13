select * from(
                 with
                     TotalSell as (
                         select count(*) as t from invoices
                     ),
                     CWMS as (
                         select e.EmployeeId, i.BillingCountry as Country, count(distinct ii.InvoiceId) as CountryCount from Employees e
                                                                                                                                 join Customers c on e.EmployeeId = c.SupportRepId
                                                                                                                                 join Invoices i on c.CustomerId = i.CustomerId
                                                                                                                                 join invoice_items ii on i.InvoiceId = ii.InvoiceId
                                                                                                                                 join Tracks t on ii.TrackId = t.TrackId
                         group by e.EmployeeId, i.BillingCountry),
                     MaxCWMS as (
                         select EmployeeId, max(CountryCount) as MaxCountryCount from CWMS
                         group by EmployeeId
                     ),
                     InvoiceCounts as (
                         select e.EmployeeId, g.Name as Genre, count(distinct ii.InvoiceId) as InvoiceCount from Employees e
                                                                                                                     join Customers c on e.EmployeeId = c.SupportRepId
                                                                                                                     join Invoices i on c.CustomerId = i.CustomerId
                                                                                                                     join invoice_items ii on i.InvoiceId = ii.InvoiceId
                                                                                                                     join Tracks t on ii.TrackId = t.TrackId
                                                                                                                     join Genres g on t.GenreId = g.GenreId
                         group by e.EmployeeId, g.Name
                     ),
                     MaxInvoiceCounts as (
                         select EmployeeId, max(InvoiceCount) as MaxInvoiceCount from InvoiceCounts
                         group by EmployeeId
                     ),
                     MediaSelled as (
                         select e.EmployeeId, g.Name as Media, count(distinct ii.InvoiceId) as MediaCount from Employees e
                                                                                                                   join Customers c on e.EmployeeId = c.SupportRepId
                                                                                                                   join Invoices i on c.CustomerId = i.CustomerId
                                                                                                                   join invoice_items ii on i.InvoiceId = ii.InvoiceId
                                                                                                                   join Tracks t on ii.TrackId = t.TrackId
                                                                                                                   join media_types g on t.MediaTypeId = g.MediaTypeId
                         group by e.EmployeeId, g.Name),
                     MaxMediaSelled as (
                         select EmployeeId, max(MediaCount) as MaxMediaCount from MediaSelled
                         group by EmployeeId
                     ), test as (

                     select employees.EmployeeId,
                            employees.LastName,
                            employees.FirstName,
                            ts.t                      as [Total Sell],
                            count(invoices.InvoiceId) as [Total Sell By Employee],
                            case
                                when cwms.Country is null then '-'
                                else cwms.Country
                                end as [Country With Most Sales],
                            case
                                when ic.Genre is null then '-'
                                else ic.Genre
                                end as [Most Genre Selled],
                            case
                                when ms.Media is null then '-'
                                else ms.Media
                                end as [Most Media Type Selled]

                     from employees
                              left join customers on employees.EmployeeId = customers.SupportRepId
                              left join invoices on customers.CustomerId = invoices.CustomerId
                              inner join TotalSell ts
                              left join CWMS cwms on employees.EmployeeId = cwms.EmployeeId and cwms.CountryCount
                         in (select MaxCountryCount from MaxCWMS where EmployeeId = employees.EmployeeId)
                              left join InvoiceCounts ic on employees.EmployeeId = ic.EmployeeId and ic.InvoiceCount
                         in (select MaxInvoiceCount from MaxInvoiceCounts where EmployeeId = employees.EmployeeId)
                              left join MediaSelled ms on employees.EmployeeId = ms.EmployeeId and ms.MediaCount
                         in (select MaxMediaCount from MaxMediaSelled where EmployeeId = employees.EmployeeId)
                     group by employees.EmployeeId, employees.FirstName, employees.LastName, ic.Genre),
                     m as (
                         select max([Total Sell By Employee]) as e from test
                     )

                 select test.LastName, test.FirstName, test."Total Sell", test."Total Sell By Employee", test."Country With Most Sales", test."Most Genre Selled", test."Most Media Type Selled", case
                                                                                                                                                                                                      when round(test.[Total Sell By Employee]/(m.e*0.01),2) = 0 or round(test.[Total Sell By Employee]/(m.e*0.01),2) = 100 then '-'
                                                                                                                                                                                                      else round(test.[Total Sell By Employee]/(m.e*0.01),2)
                     end as [Percentage sales compared best seller] from employees
                                                                             inner join test on test.EmployeeId = employees.EmployeeId
                                                                             inner join m)