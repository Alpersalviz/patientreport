<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 27.02.2017
 * Time: 21:58
 */

namespace AppBundle\Data\Model;


class Hospital
{

    public $ID;
    public $NameOfHosp;
    public $CityOfHosp; 

    public function  MapFrom (array $data)
    {
        $this->ID = $data['ID'];
        $this->NameOfHosp = $data['name_hosp'];
        $this->CityOfHosp = $data['city_hosp'];

        return $this;
    }
}