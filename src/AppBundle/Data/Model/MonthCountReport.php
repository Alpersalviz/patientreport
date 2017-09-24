<?php
/**
 * Created by PhpStorm.
 * User: alper
 * Date: 13/09/2017
 * Time: 03:33
 */

namespace AppBundle\Data\Model;


class MonthCountReport
{
    public $CountMonth;
    public $Month;

    public function  MapFrom (array $data)
    {
        $this->CountMonth = $data['countMonth'];
        $this->Month = $data['month'];

        return $this;
    }
}