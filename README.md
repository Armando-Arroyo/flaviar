# flaviar

# Retail analysis

## 1
In order to clean up the promo_code field and fill in the NULL entries is to use the `UPPER()` function along the `CASE WHEN` statement
The `CASE WHEN` statement replaces the `NULL` entries with "NO-PROMO" and the `UPPER()` function transforms every variation of 'whiskey15' into "WHISKEY15".

``` sql
SELECT UPPER((SELECT CASE WHEN order_items.promo_code IS NULL THEN 'NO-PROMO' ELSE promo_code END)) AS clean_promo_code, customer_id, order_id, item_id, order_created_date from order_items;
```

An alternative is to use the extension `citext`, but that is only helpful if there are only a few known variants of the promo_code or the function `ILIKE`, although that's not very efficient in terms of performance.

## 2
To query the top 5 sold items per cart besides product 1001 one may use the following query:

``` sql
SELECT order_id, item_id, COUNT(item_id) AS item_count FROM order_items WHERE item_id <> 1001 GROUP BY order_id, item_id ORDER BY order_id, item_count desc;
```

## 3
Assuming that we know the dates when the campaign started and ended we can search for all the sales done that particular week and that the item_code of the bottle is 1000

``` sql
SELECT * FROM order_items WHERE item_code = 1000 AND order_created_date >= start_promo_date AND order_created_date <= end_promo_date ORDER BY promo_code;
```
Before verifying if there was an uplift in sales there are a few considerations that need to be taken into account. For example, if there was a major holiday during the week of the promotion or it was a regular week and whether the sales have been steady or declining recently.

Since this was an email campaign, first we can compare the number of sales made using the promo code with the number of emails sent with said code. This way we can obtain the conversion rate of emails sent to sales. Afterwards one can compare the number of sales made including organic sales and the ones where the promo code was used, along with the net profit, with sales and profit of previous weeks or the weekly average of the past year.

# General questions

## 1

A way to test whether the new feature can be a success is using **AB testing**. Using this method, a version of the website which includes the new feature is shown to half the users and the original version is shown to the other half, which is the control group. The conversion rate of leads to buying customers is measured for both versions. The experiment can be stopped once statistical significance has been reached to avoid skewing the results. Afterwards by comparing the conversion rates from both versions one can determine whether the new feature had a positive, negative or no effect at all.

## 2
### a

To clean up and manipulate missing data, **pandas** and possibly **numpy** would be my first choices. However, there also considerations that need to be taken into account when handling missing data like the distribution of answers, or the type of answer in order to avoid biases towards a certain group.


### b

The first step, if possible, would be talking to the people who uses or generates the data in order to have a basis or context. Afterwards to determine the importace of variables I would use a statistical method such as: correlation, covariance, scatter plots, etc.

In order to group respondents depending on their answers, i would look at the distribution of answers to multiple choice questions and when there are open worded answers I would use a simple text classifier, like the ones used for classification of reviews, to analyze the content of the answers. I would use tools like scikit-lear or turicreate to analyze the data and build word count vectors in order to build such classifier.
