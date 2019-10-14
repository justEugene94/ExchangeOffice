<?php


class PurchasesController extends AController
{
    public function store()
    {
        if (empty($_POST)) {
            return $this->response('Something went wrong!', 500);
        }

        $input = $this->sanitizeString($_POST);

        $validator = $this->validator($input);

        if (is_string($validator)) {
            return $this->response($validator, 500);
        }

        $PurchasedDb = new Purchase(HOST, USER, PASS, DB);

        $purchase = $PurchasedDb->save(
                                $_POST['first_name'],
                                $_POST['last_name'],
                                $_POST['phone'],
                                $_POST['currency_id'],
                                $_POST['exchange_currency_id'],
                                $_POST['unit_id'],
                                $_POST['trade_id'],
                                $_POST['value']
            );

        if (!$purchase)
        {
            return $this->response('Something went wrong!', 500);
        }

        return $this->response($purchase, 200);
    }
}