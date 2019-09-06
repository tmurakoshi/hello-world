SELECT DISTINCT
    fullVisitorId,
    clientId,
    hits.transaction.transactionRevenue / 1e6 AS transactionRevenue,
    hits.transaction.transactionId AS transactionId,
    CAST(PARSE_TIMESTAMP('%F', REGEXP_REPLACE(Date, r'(\d\d\d\d)(\d\d)(\d\d)', '\\1-\\2-\\3')) AS DATE) AS TransactionDate,
    geoNetwork.country as country

FROM
     `project-223002.49173390.ga_sessions_*`,
    UNNEST(hits) AS hits
    
WHERE
    _TABLE_SUFFIX BETWEEN '20180501' AND '20190903'
    AND hits.transaction.transactionRevenue > 0

ORDER BY TransactionDate
