<?php


class Purchase extends Database
{
    public function __construct($host, $user, $pass, $db)
    {
        parent::__construct($host, $user, $pass, $db);
    }

    public function save(
                        string $firstName,
                        string $lastName,
                        string $phone,
                        int $currencyId,
                        int $exchangeCurrencyId,
                        int $unitId,
                        int $tradeId,
                        int $value)
    {

        $userDb = new User(HOST, USER, PASS, DB);
        $user = $userDb->save($firstName, $lastName, $phone);

        if (!$user)
        {
            return false;
        }

       $params = "'{$user['id']}', '{$currencyId}', '{$exchangeCurrencyId}', '{$unitId}', '$tradeId', '$value'";

        $sql = "INSERT INTO `purchases` (`user_id`, `currency_id`, `exchange_currency_id`, `unit_id`, `trade_id`, `value`) VALUES ({$params})";


        if(!mysqli_query($this->db, $sql)){
            return false;
        }

        $purchase = $this->show('purchases', mysqli_insert_id($this->db));

        mysqli_close($this->db);

        return $purchase;
    }

    public function getCount()
    {
        $count = [];

        $sql = "SELECT COUNT(`id`) FROM `purchases` WHERE `trade_id` = '1'";

        $res = mysqli_query($this->db, $sql);
        $buy = mysqli_fetch_row($res);
        $count['buy'] = $buy[0];

        $sql = "SELECT COUNT(`id`) FROM `purchases` WHERE `trade_id` = '2'";

        $res = mysqli_query($this->db, $sql);
        $sale = mysqli_fetch_row($res);
        $count['sale'] = $sale[0];

        mysqli_close($this->db);

        return $count;
    }
}