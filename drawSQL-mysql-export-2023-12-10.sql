CREATE TABLE `products`(
    `product_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `category` VARCHAR(255) NOT NULL,
    `description` TEXT  NULL,
    `price` DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    `products` ADD PRIMARY KEY `products_product_id_primary`(`product_id`);
CREATE TABLE `payments`(
    `payment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` INT NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL,
    `payment_date` DATE NOT NULL,
    `method_id` INT NOT NULL
);
ALTER TABLE
    `payments` ADD PRIMARY KEY `payments_payment_id_primary`(`payment_id`);
CREATE TABLE `orders`(
    `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `employee_id` INT  NULL,
    `customer_id` INT  NULL,
    `order_date` DATE NOT NULL,
    `total_amount` DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    `orders` ADD PRIMARY KEY `orders_order_id_primary`(`order_id`);
CREATE TABLE `employee_roles`(
    `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `role_name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `employee_roles` ADD PRIMARY KEY `employee_roles_role_id_primary`(`role_id`);
ALTER TABLE
    `employee_roles` ADD UNIQUE `employee_roles_role_name_unique`(`role_name`);
CREATE TABLE `order_details`(
    `order_detail_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` INT  NULL,
    `product_id` INT  NULL,
    `quantity` INT NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    `order_details` ADD PRIMARY KEY `order_details_order_detail_id_primary`(`order_detail_id`);
CREATE TABLE `customers`(
    `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `registration_date` DATE NOT NULL
);
ALTER TABLE
    `customers` ADD PRIMARY KEY `customers_customer_id_primary`(`customer_id`);
ALTER TABLE
    `customers` ADD UNIQUE `customers_email_unique`(`email`);
CREATE TABLE `employees`(
    `emp_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `birth_date` DATE NOT NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `email` INT NOT NULL,
    `hire_date` DATE NOT NULL,
    `role_id` INT NOT NULL
);
ALTER TABLE
    `employees` ADD PRIMARY KEY `employees_emp_id_primary`(`emp_id`);
ALTER TABLE
    `employees` ADD UNIQUE `employees_phone_number_unique`(`phone_number`);
CREATE TABLE `payment_methods`(
    `method_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `method_name` VARCHAR(255)  NULL
);
ALTER TABLE
    `payment_methods` ADD PRIMARY KEY `payment_methods_method_id_primary`(`method_id`);
CREATE TABLE `role_position`(
    `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `role_name` VARCHAR(255) NOT NULL,
    `role_description` VARCHAR(255)  NULL,
    `salary` DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    `role_position` ADD PRIMARY KEY `role_position_role_id_primary`(`role_id`);
ALTER TABLE
    `role_position` ADD UNIQUE `role_position_role_name_unique`(`role_name`);
ALTER TABLE
    `employees` ADD CONSTRAINT `employees_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `employee_roles`(`role_id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employees`(`emp_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_method_id_foreign` FOREIGN KEY(`method_id`) REFERENCES `payment_methods`(`method_id`);
ALTER TABLE
    `order_details` ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`);
ALTER TABLE
    `role_position` ADD CONSTRAINT `role_position_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `employee_roles`(`role_id`);
ALTER TABLE
    `order_details` ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`product_id`);
