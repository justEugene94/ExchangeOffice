<?php


class User extends Database
{
    public function __construct($host, $user, $pass, $db)
    {
        parent::__construct($host, $user, $pass, $db);
    }

    public function save(string $firstName, string $lastName, string $phone)
    {
        if (!$user = $this->get($phone))
        {
//            $query = $this->dbh->prepare("INSERT INTO `users` VALUES (`first_name`, `last_name`, `phone#`) VALUES (?, ?, ?)");
//            $query->execute([$firstName, $lastName, $phone]);
//            $user = $query->fetch();

            $params = "'{$firstName}', '{$lastName}', '{$phone}'";

            $sql = "INSERT INTO `users` (`first_name`, `last_name`, `phone#`) VALUES ({$params})";

            $res = mysqli_query($this->db, $sql);

            if(!$res){
                return False;
            }

            $user = $this->show('users', mysqli_insert_id($this->db));
        }

        mysqli_close($this->db);

        return $user;
    }

    protected function get(string $phone)
    {
//        $query = $this->dbh->prepare("SELECT * FROM `users` WHERE `phone#` = ?");
//        $query->execute([$phone]);

        return $this->show('users', $phone, 'phone#');
    }
}