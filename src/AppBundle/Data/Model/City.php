<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 8.05.2017
 * Time: 13:35
 */

namespace AppBundle\Data\Model;


class City
{

    public $ID;
    public $City;

    public function  MapFrom (array $data)
    {
        $this->ID = $data['ID'];
        $this->City = $data['city'];

        return $this;
    }
}