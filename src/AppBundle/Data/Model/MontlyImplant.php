<?php
/**
 * Created by PhpStorm.
 * User: alper
 * Date: 13/09/2017
 * Time: 02:03
 */

namespace AppBundle\Data\Model;


class MontlyImplant
{
    public $CountMonth;
    public $Month;
    public $HospitalName;
    public $HospitalId;

    public function  MapFrom (array $data)
    {
        $this->CountMonth = $data['countMonth'];
        $this->Month = $data['Month'];
        $this->HospitalName = $data['name_hosp'];
        $this->HospitalId = $data['ID'];

        return $this;
    }
}