SELECT item
FROM (
    SELECT item, COUNT(*) AS total
    FROM item_bought
    GROUP BY item
) AS item_counts
WHERE total <> (SELECT MAX(total) FROM (SELECT item, COUNT(*) AS total FROM item_bought GROUP BY item) AS max_count)
AND total <> (SELECT MIN(total) FROM (SELECT item, COUNT(*) AS total FROM item_bought GROUP BY item) AS min_count);