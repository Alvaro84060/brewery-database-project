CREATE TABLE `products`(
    `product_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NULL,
    `category` VARCHAR(255) NULL,
    `description` TEXT NOT NULL,
    `price` DECIMAL(8, 2) NULL
);
CREATE TABLE `payments`(
    `payment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `amount` DECIMAL(8, 2) NULL,
    `payment_date` DATE NOT NULL,
    `method_id` INT NOT NULL
);
CREATE TABLE `orders`(
    `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `order_date` DATE NULL,
    `total_amount` DECIMAL(8, 2) NULL
);
CREATE TABLE `employee_roles`(
    `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role_name` VARCHAR(255) NULL
);
ALTER TABLE
    `employee_roles` ADD UNIQUE `employee_roles_role_name_unique`(`role_name`);
CREATE TABLE `order_details`(
    `order_detail_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `quantity` INT NULL,
    `amount` DECIMAL(8, 2) NULL
);
CREATE TABLE `customers`(
    `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `phone_number` VARCHAR(255) NULL,
    `registration_date` DATE NOT NULL
);
ALTER TABLE
    `customers` ADD UNIQUE `customers_email_unique`(`email`);
CREATE TABLE `employees`(
    `emp_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `birth_date` DATE NOT NULL,
    `phone_number` VARCHAR(255) NULL,
    `email` BIGINT NOT NULL,
    `hire_date` DATE NULL,
    `role_id` BIGINT NOT NULL,
    `salary` DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    `employees` ADD UNIQUE `employees_phone_number_unique`(`phone_number`);
CREATE TABLE `payment_methods`(
    `method_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `method_name` VARCHAR(255) NOT NULL
);
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
    `order_details` ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`product_id`);