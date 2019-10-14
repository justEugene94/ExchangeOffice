<?php


class IndexController extends AController
{
    public function getCourse()
    {
        $data = file_get_contents('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5');
        $courses = json_decode($data, true);

        $purchaseDB = new Purchase(HOST, USER, PASS, DB);
        $purchaseCounts =  $purchaseDB->getCount();

        $coefficientDB = new Coefficient(HOST, USER, PASS, DB);
        $coefficients = $coefficientDB->getCoefficientByPurchases((int)$purchaseCounts['buy'], (int)$purchaseCounts['sale']);

        foreach ($courses as $k => $course)
        {
            if ($course['ccy'] !== 'BTC') {
                if (!empty($coefficients['buy']))
                {
                    $courses[$k]['buy'] *= $coefficients['buy'];
                }

                if (!empty($coefficients['sale']))
                {
                    $courses[$k]['sale'] *= $coefficients['sale'];
                }
            }
        }

        return $this->response($courses, 200);
    }
}