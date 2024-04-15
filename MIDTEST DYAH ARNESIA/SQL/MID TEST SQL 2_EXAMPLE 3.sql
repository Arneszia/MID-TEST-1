WITH item_counts AS (
    SELECT item, COUNT(*) AS total_bought
    FROM item_bought
    GROUP BY item
)
SELECT item
FROM item_counts
WHERE total_bought != (SELECT MAX(total_bought) FROM item_counts)
  AND total_bought != (SELECT MIN(total_bought) FROM item_counts);