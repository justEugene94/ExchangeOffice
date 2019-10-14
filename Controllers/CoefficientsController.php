<?php


class CoefficientsController extends AController
{
    public function index()
    {
        $coefficientDb = new Coefficient(HOST, USER, PASS, DB);

        $coefficients = $coefficientDb->lists('coefficients');

        return $this->response($coefficients, 200);
    }

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

        $coefficientDb = new Coefficient(HOST, USER, PASS, DB);

        $coefficient = $coefficientDb->save(
                                            $_POST['trade_id'],
                                            $_POST['amount'],
                                            $_POST['percent']
        );

        return $this->response($coefficient, 200);
    }
}