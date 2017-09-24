<?php
/**
 * Created by PhpStorm.
 * User: alper
 * Date: 13/09/2017
 * Time: 03:33
 */

namespace AppBundle\Data\Model;


class HospitalReport
{
    public $TotalCount;
    public $HospitalName;
    public $HospitalId;

    public function  MapFrom (array $data)
    {
        $this->TotalCount = $data['countHospital'];
        $this->HospitalName = $data['name_hosp'];
        $this->HospitalId = $data['ID'];

        return $this;
    }
}