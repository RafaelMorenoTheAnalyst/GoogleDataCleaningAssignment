--Assignment from the Google Data Analytics (cleaning data course)

SELECT *
FROM GoogleCert.dbo.[Lauren-s-Furniture-Store-Transaction-Table]

--While reviewing the datatypes we notice that purchase price is recongnized as a string. 
SELECT cast(purchase_price as float)
FROM GoogleCert.dbo.[Lauren-s-Furniture-Store-Transaction-Table]
order by cast(purchase_price as float) desc

--We are asked to look at purchases that took place durring a pormotional period of 12/01/2020 - 12/31/2021
--We want to clean up the appearance of the date column to only show the date without the time so we convert it from a datetime data type to date
SELECT purchase_price, CAST(date as date) as date
FROM GoogleCert.dbo.[Lauren-s-Furniture-Store-Transaction-Table]
WHERE date between '2020-12-01' and '2020-12-31'

--The owner wants to know if customers have certain color preferences
--We need to be able to differentiate between the different products by color
--in this example we will look at couches specifically
SELECT CONCAT(product_code,product_color) as new_product_code
FROM GoogleCert.dbo.[Lauren-s-Furniture-Store-Transaction-Table]
WHERE product = 'couch'
--Looking or null values in our dataset
SELECT COALESCE (product,product_code) as product_info
FROM GoogleCert.dbo.[Lauren-s-Furniture-Store-Transaction-Table]
