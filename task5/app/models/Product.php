<?php
include_once __DIR__ . "\..\database\config.php";
include_once __DIR__ . "\..\database\operations.php";
class Product extends config implements operations
{
    private $id,
        $name_en,
        $name_ar,
        $price,
        $code,
        $image,
        $desc_en,
        $desc_ar,
        $quantity,
        $status,
        $subcategory_id,
        $brand_id,
        $created_at,
        $updated_at;


    /**
     * Get the value of id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of name_en
     */
    public function getName_en()
    {
        return $this->name_en;
    }

    /**
     * Set the value of name_en
     *
     * @return  self
     */
    public function setName_en($name_en)
    {
        $this->name_en = $name_en;

        return $this;
    }

    /**
     * Get the value of name_ar
     */
    public function getName_ar()
    {
        return $this->name_ar;
    }

    /**
     * Set the value of name_ar
     *
     * @return  self
     */
    public function setName_ar($name_ar)
    {
        $this->name_ar = $name_ar;

        return $this;
    }

    /**
     * Get the value of price
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set the value of price
     *
     * @return  self
     */
    public function setPrice($price)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Get the value of code
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set the value of code
     *
     * @return  self
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get the value of image
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * Set the value of image
     *
     * @return  self
     */
    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get the value of desc_en
     */
    public function getDesc_en()
    {
        return $this->desc_en;
    }

    /**
     * Set the value of desc_en
     *
     * @return  self
     */
    public function setDesc_en($desc_en)
    {
        $this->desc_en = $desc_en;

        return $this;
    }

    /**
     * Get the value of desc_ar
     */
    public function getDesc_ar()
    {
        return $this->desc_ar;
    }

    /**
     * Set the value of desc_ar
     *
     * @return  self
     */
    public function setDesc_ar($desc_ar)
    {
        $this->desc_ar = $desc_ar;

        return $this;
    }

    /**
     * Get the value of quantity
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * Set the value of quantity
     *
     * @return  self
     */
    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get the value of status
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set the value of status
     *
     * @return  self
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get the value of subcategory_id
     */
    public function getSubcategory_id()
    {
        return $this->subcategory_id;
    }

    /**
     * Set the value of subcategory_id
     *
     * @return  self
     */
    public function setSubcategory_id($subcategory_id)
    {
        $this->subcategory_id = $subcategory_id;

        return $this;
    }

    /**
     * Get the value of brand_id
     */
    public function getBrand_id()
    {
        return $this->brand_id;
    }

    /**
     * Set the value of brand_id
     *
     * @return  self
     */
    public function setBrand_id($brand_id)
    {
        $this->brand_id = $brand_id;

        return $this;
    }

    /**
     * Get the value of created_at
     */
    public function getCreated_at()
    {
        return $this->created_at;
    }

    /**
     * Set the value of created_at
     *
     * @return  self
     */
    public function setCreated_at($created_at)
    {
        $this->created_at = $created_at;

        return $this;
    }

    /**
     * Get the value of updated_at
     */
    public function getUpdated_at()
    {
        return $this->updated_at;
    }

    /**
     * Set the value of updated_at
     *
     * @return  self
     */
    public function setUpdated_at($updated_at)
    {
        $this->updated_at = $updated_at;

        return $this;
    }
    public function create()
    {
        # code...
    }
    public function read()
    {
        $query = " SELECT `id`,`name_en`,`image`,`price`,`desc_en` FROM products WHERE `status` =$this->status ORDER BY  `price`  ASC, `quantity` DESC ,`name_en` ASC ";
        return $this->runDQL($query);
    }
    public function update()
    {
        # code...
    }
    public function delete()
    {
        # code...   
    }
    public function getPoductsBySub()
    {
        $query = " SELECT  `id`,`name_en`,`image`,`price`,`desc_en` FROM products WHERE `status` = $this->status AND `subcategory_id` = '$this->subcategory_id' ORDER BY  `price`  ASC, `quantity` DESC ,`name_en` ASC ";
        return $this->runDQL($query);
    }
    public function searchOnId()
    {
        $query = "SELECT
        `products`.*,
        COUNT(`reviews`.`productct_id`) AS `reviews_count`,
        IF(
            ROUND(AVG(`reviews`.`value`)) IS NULL,
            0,
            ROUND(AVG(`reviews`.`value`))
        ) AS `reviews_avg`,
        `subcategories`.`name_en` AS `subcategory_name_en`,
        `brands`.`name_en` AS `brand_name_en`,
        `categories`.`id` AS `categorty_id`,
        `categories`.`name_en` AS `category_name_en`
    FROM
        `products`
    LEFT JOIN `reviews` ON `products`.`id` = `reviews`.`productct_id`
    JOIN `subcategories` ON
        `subcategories`.`id` = `products`.`subcategory_id`
    LEFT JOIN `categories` ON
        `categories`.`id` = `subcategories`.`category_id`
    LEFT JOIN `brands` ON
        `brands`.`id` = `products`.`brand_id`
    WHERE
        `products`.`status` = $this->status AND `products`.`id`=$this->id
    GROUP BY
        `products`.`id`";
        return $this->runDQL($query);
    }

    public function getSpecs()
    {
        $query = "SELECT 
            `products_spacs`.`product_id`,
            CONCAT(`specs`.`name_en`,' : ',`products_spacs`.`value_en`) 
            AS `specs_en`
            FROM `specs`
            JOIN `products_spacs` ON `specs`.`id` = `products_spacs`.`space_id`
            WHERE `products_spacs`.`product_id`=$this->id";
        return $this->runDQL($query);
    }
    public function getReviews()
    {
        $query = "SELECT
        `reviews`.*,
        CONCAT(`users`.`first_name`,' ',`users`.`last_name`) As `full_name`
    FROM
        `reviews`
        JOIN `users` ON `users`.`id` = `reviews`.`user_id`
    WHERE
        `reviews`.`productct_id` = $this->id";
        return $this->runDQL($query);
    }

    // task 1 --------------------------- new product
    public function getNewProducts()
    {
        $query = "SELECT  `id`,`name_en`,`image`,`price`,`desc_en`,`created_at` FROM products WHERE `status` = $this->status  ORDER BY  `created_at`  DESC LIMIT 4";
        return $this->runDQL($query);
    }

     // task 2 --------------------------- most rated product
    public function getMostRatedProducts()
    {
        $query = "SELECT
        `products`.*,
        COUNT(`reviews`.`productct_id`) AS `reviews_count`,
        IF(
            ROUND(AVG(`reviews`.`value`)) IS NULL,
            0,
            ROUND(AVG(`reviews`.`value`))
        ) AS `reviews_avg`,
        `subcategories`.`name_en` AS `subcategory_name_en`,
        `brands`.`name_en` AS `brand_name_en`,
        `categories`.`id` AS `categorty_id`,
        `categories`.`name_en` AS `category_name_en`
    FROM
        `products`
    LEFT JOIN `reviews` ON `products`.`id` = `reviews`.`productct_id`
    JOIN `subcategories` ON `subcategories`.`id` = `products`.`subcategory_id`
    LEFT JOIN `categories` ON `categories`.`id` = `subcategories`.`category_id`
    LEFT JOIN `brands` ON `brands`.`id` = `products`.`brand_id`
    WHERE
        `products`.`status` = $this->status
    GROUP BY
        `products`.`id`
    ORDER BY
        `reviews_count`
    DESC
        ,
        `reviews_avg`
    DESC
    LIMIT 4";
        return $this->runDQL($query);
    }
    public function getOrderProducts()
    {
        $query = "SELECT
        `products`.*,
        COUNT(`orders_products`.`order_id`) AS `orders_count`,
        `products`.`price` AS `products_price`,
        `orders`.`id` AS `orders_id`
    FROM
        `orders_products`
    JOIN `products` ON `products`.`id` = `orders_products`.`product_id`
    LEFT JOIN `orders` ON `orders`.`id` = `orders_products`.`order_id`
    WHERE
        `products`.`status` = $this->status
    GROUP BY
        `products`.`id`
    ORDER BY
        `orders_count`
    DESC ,
    `products_price`
    DESC
    LIMIT 4";
        return $this->runDQL($query);
    }
    
}
