# Calculate how much money earned, broken down by year and subscription
/*
For appstore transactions, subtract 30% (commission), for google - 15%, leave the rest.
According to subscription.week, debits occur every week.
According to subscription.month, debits occur every month.
This means you need to multiply price by the number of entire subscription renewal periods starting from created_at to canceled_at. If canceled_at null, then until 2023-12-31 23:59:59.
 */