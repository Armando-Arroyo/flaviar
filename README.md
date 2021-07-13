# flaviar

# Retail analysis

## In order to clean up the promo_code field and fill in the NULL entries is to use the UPPER() function along the CASE WHEN statement
## The CASE WHEN statement replaces the NULL entries with "NO-PROMO" and the UPPER() function transforms every variation of 'whiskey15'
## into "WHISKEY15".

``` sql
SELECT UPPER((SELECT CASE WHEN order_items.promo_code IS NULL THEN 'NO-PROMO' ELSE promo_code END)) AS clean_promo_code, customer_id, order_id, item_id, order_created_date from order_items;
```

## An alternative is to use the extension citext, but that is only helpful if there are only a few known variants of the promo_code or
## the function ILIKE, although that's not very efficient in terms of performance.


## To query the top 5 sold items besides product 1001 one may use the following query

``` sql
SELECT COUNT(item_id) AS item_count, item_id, order_id FROM order_items WHERE item_id <> 1001 GROUP BY item_id, order_id ORDER BY item_count desc LIMIT 5;
```
