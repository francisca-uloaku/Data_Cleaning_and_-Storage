--Creating all the tables 
T1: Customer Dimension
CREATE TABLE IF NOT EXISTS customer (
    customer_id VARCHAR(50) PRIMARY KEY, -- PK
    phone_number VARCHAR(30),
    customer_name VARCHAR(100),
    gender VARCHAR(15),
    age_group VARCHAR(20),
    city VARCHAR(50),
    region VARCHAR(50),
    customer_segment VARCHAR(50)
);

-- T2: Order Dimension
CREATE TABLE IF NOT EXISTS order (
    order_id VARCHAR(50) PRIMARY KEY, -- PK
    order_revenue NUMERIC(12, 2),
    order_status VARCHAR(30),
    order_date DATE
);

-- T3: Product Dimension
CREATE TABLE IF NOT EXISTS product (
    product_id VARCHAR(50) PRIMARY KEY, -- PK
    product_category VARCHAR(50),
    product_name VARCHAR(150),
    sales_channel VARCHAR(50)
);

-- T4: Delivery Dimension
CREATE TABLE IF NOT EXISTS delivery (
    delivery_fee NUMERIC(10, 2),
    delivery_status VARCHAR(30),
    delivery_days INT 
    customer_id VARCHAR(50) FOREIGN KEY, -- FK 
    product_id VARCHAR(50) PRIMARY KEY, -- FK  
);

-- T5: Rating Dimension
CREATE TABLE IF NOT EXISTS rating (
    customer_rating INT,
    return_flag VARCHAR(10),
    customer_id VARCHAR(50) FOREIGN KEY -- FK
);



-- Fact Table
CREATE TABLE IF NOT EXISTS fact (
    fact_id SERIAL PRIMARY KEY,
    quantity INT,
    unit_price NUMERIC(10, 2),
    discount_rate NUMERIC(5, 2),
    payment_method VARCHAR(30),
    delivery_fee NUMERIC(10, 2),
    order_revenue NUMERIC(12, 2),
    customer_id VARCHAR(50) FOREIGN KEY, --FK
    order_id VARCHAR(50) FOREIGN KEY, -- FK
    product_id VARCHAR(50) PRIMARY KEY -- FK
    
    -- Foreign Keys linking back to Dimensions
    customer_id VARCHAR(50) REFERENCES customer(customer_id), -- FK
    order_id VARCHAR(50) REFERENCES order(order_id),         -- FK
    product_id VARCHAR(50) REFERENCES product(product_id),   -- FK
   
);