<?php


class Coefficient extends Database
{
    public function __construct($host, $user, $pass, $db)
    {
        parent::__construct($host, $user, $pass, $db);
    }

    public function save(int $tradeId, int $amount, float $percent)
    {
        $params = "'{$tradeId}', '{$amount}', '{$percent}'";

        $sql = "INSERT INTO `coefficients` (`trade_id`, `amount`, `percent`) VALUES ({$params})";

        if (!mysqli_query($this->db, $sql)) {
            return false;
        }

        $coefficient = $this->show('coefficients', mysqli_insert_id($this->db));

        mysqli_close($this->db);

        return $coefficient;
    }

    public function getCoefficientByPurchases(int $buyersCount, int $salesCount)
    {
        $coefficients = [];

        $sql = "SELECT `percent` FROM `coefficients` WHERE `amount` < '{$buyersCount}' AND `trade_id` = '1' ORDER BY `amount` DESC LIMIT 1";

        $res = mysqli_query($this->db, $sql);
        $buy = mysqli_fetch_row($res);
        $coefficients['buy'] = $buy[0];

        $sql = "SELECT `percent` FROM `coefficients` WHERE `amount` < '{$salesCount}' AND `trade_id` = '2' ORDER BY `amount` DESC LIMIT 1";

        $res = mysqli_query($this->db, $sql);
        $sale = mysqli_fetch_row($res);
        $coefficients['sale'] = $sale[0];

        return $coefficients;
    }
}