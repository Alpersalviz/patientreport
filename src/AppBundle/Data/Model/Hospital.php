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

    public $HospitalID;
    public $NameOfHosp;
    public $CityOfHosp;
    public $AdressOfHosp;

    public function  MapFrom (array $data)
    {
        $this->HospitalID = $data['hospitalID'];
        $this->NameOfHosp = $data['name_hosp'];
        $this->CityOfHosp = $data['city_hosp'];
        $this->AdressOfHosp = $data['adress_hosp'];

        return $this;
    }
}