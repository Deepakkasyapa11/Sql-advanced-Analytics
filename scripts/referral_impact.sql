WITH RECURSIVE referral_chain AS (
    -- Anchor member: Start with everyone
    SELECT id, name, id AS original_referrer
    FROM customers
    
    UNION ALL
    
    -- Recursive member: Link people to who they referred
    SELECT c.id, c.name, rc.original_referrer
    FROM customers c
    JOIN referral_chain rc ON c.referred_by_id = rc.id
)
SELECT 
    t1.name AS original_influencer,
    SUM(o.amount) AS total_influenced_revenue
FROM referral_chain rc
JOIN orders o ON rc.id = o.customer_id
JOIN customers t1 ON rc.original_referrer = t1.id
WHERE rc.id != rc.original_referrer  -- Only count indirect revenue
GROUP BY 1
ORDER BY 2 DESC;