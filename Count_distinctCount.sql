-- Following query returns number of states whch orders were delivered. But it will return more than 900 but there are only 50 states. It counts dublicates as well.
SELECT count warehouse.state as num_of_states
From `astral-trees-454812-s3.warehouse_orders.Orders` as orders
JOIN
    `astral-trees-454812-s3.warehouse_orders.warehouse` warehouse 
    ON orders.warehouse_id = warehouse.warehouse_id





-- Following query returns number of states whch orders were delivered. Distincts eliminates dublicated and counts each state only once
SELECT count (distinct warehouse.state) as num_of_states
From `astral-trees-454812-s3.warehouse_orders.Orders` as orders
JOIN
    `astral-trees-454812-s3.warehouse_orders.warehouse` warehouse 
    ON orders.warehouse_id = warehouse.warehouse_id
