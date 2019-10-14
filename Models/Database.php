<?php


class Database
{
//    protected $dbh;
    protected $db;

    public function __construct($host, $user, $pass, $db){
//        try {
//            $dbh = new PDO("mysql:host={$host};dbname={$db}", $user, $pass);
//            $this->dbh = $dbh;
//        } catch (PDOException $e) {
//            print "Error: " . $e->getMessage() . "<br/>";
//            die();
//        }

        $this->db = mysqli_connect($host, $user, $pass);
        if(!$this->db){
            exit('No database connection');
        }
        if(!mysqli_select_db($this->db, $db)){
            exit('No table!');
        }
        mysqli_query($this->db,'SET NAMES utf8');
    }

    public function __destruct()
    {
        mysqli_close($this->db);
    }

    public function lists(string $table)
    {
        $sql = "SELECT * FROM `{$table}`";

        $res = mysqli_query($this->db, $sql);

        mysqli_close($this->db);

        return mysqli_fetch_all($res, MYSQLI_ASSOC);
    }

    protected function show(string $table, int $value, string $column = 'id')
    {
        $sql = "SELECT * FROM `{$table}` WHERE `{$column}` = '{$value}'";

        $res = mysqli_query($this->db, $sql);

        return mysqli_fetch_assoc($res);
    }
}