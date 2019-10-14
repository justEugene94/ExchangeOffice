<?php


abstract class AController
{
    protected function sanitizeString($var)
    {
        if(is_array($var)){
            foreach ($var as $item){
                $item = stripslashes($item);
                $item = strip_tags($item);
                $item = htmlentities($item);
                $var[] = $item;
            }
            return $var;
        }else{
            $var = stripslashes($var);
            $var = strip_tags($var);
            $var = htmlentities($var);
            return $var;
        }
    }

    protected function validator($request){
        $pattern = '/[а-яА-яёЁa-zA-Z0-9]+$/';
        if(is_array($request)) {
            foreach ($request as $item) {
                if (empty($item)) {
                    return 'Something went wrong!';
                } elseif (preg_match($pattern, $item)) {
                    $arr[] = $item;
                } else {
                    return 'Something went wrong!';
                }
            }
            return $arr;
        }
        else{
            if (empty($request)) {
                return 'Something went wrong!';
            } elseif (preg_match($pattern, $request)) {
                $string = $request;
            } else {
                return 'Something went wrong!';
            }
            return TRUE;
        }
    }

    protected function response($data, $status = 500) {
        header("HTTP/1.1 {$status} {$this->requestStatus($status)}");
        return json_encode($data);
    }

    private function requestStatus($code) {
        $status = array(
            200 => 'OK',
            404 => 'Not Found',
            405 => 'Method Not Allowed',
            500 => 'Internal Server Error',
        );
        return ($status[$code])?$status[$code]:$status[500];
    }
}