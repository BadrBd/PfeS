CREATE TABLE category (
	id MEDIUMINT AUTO_INCREMENT,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,
	CONSTRAINT pk_category_id PRIMARY KEY (id) 

);

INSERT INTO category (name, description,image_url,is_active) VALUES ('Laptop', 'This is description for Laptop category!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Television', 'This is description for Television category!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Mobile', 'This is description for Mobile category!', 'CAT_3.png', true);

CREATE TABLE user_detail (
	id MEDIUMINT AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);


INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('badr', 'bid', 'ADMIN', true, '$2b$10$uylCxt2GA1cfxXoLd.xx4e3sOxbwip4/x7KVhMXMwYxfIv0x024ny', 'vk@gmail.com', '8888888888');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('zakaria', 'bidouli', 'SUPPLIER', true, '$2b$10$ARizAo1LI4cJWtLXjoX2KemOZwkzOe5F2HdDw0IBVIbLYw6E/xw6G', 'rj@gmail.com', '9999999999');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('maroine', 'bidouli', 'SUPPLIER', true, '$2b$10$ZNhdoMeU7LN1Ut86Il1MF.AGEKpkgfth8ozWDYeoVhflF2tOGpu3G', 'ra@gmail.com', '7777777777');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('badr', 'bidouli', 'USER', true, '$2b$10$uylCxt2GA1cfxXoLd.xx4e3sOxbwip4/x7KVhMXMwYxfIv0x024ny', 'kn@gmail.com', '7777777777');


CREATE TABLE product (
	id MEDIUMINT AUTO_INCREMENT,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id)
);	

-- adding five products
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'iPhone 5s', 'apple', 'This is one of the best phone available in the market right now!', 18000, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Samsung s7', 'samsung', 'A smart phone by samsung!', 32000, 2, true, 3, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'Google Pixel', 'google', 'This is one of the best android smart phone available in the market right now!', 57000, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', ' Macbook Pro', 'apple', 'This is one of the best laptops available in the market right now!', 54000, 3, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'Dell Latitude E6510', 'dell', 'This is one of the best laptop series from dell that can be used!', 48000, 5, true, 1, 3, 0, 0 );

-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id MEDIUMINT AUTO_INCREMENT,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id MEDIUMINT AUTO_INCREMENT,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);

CREATE TABLE cart_line (
	id MEDIUMINT AUTO_INCREMENT,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);

