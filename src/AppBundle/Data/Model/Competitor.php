<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 27.02.2017
 * Time: 21:58
 */

namespace AppBundle\Data\Model;


class Competitor
{

    public $ID;
    public $HospitalId;
    public $Month;
    public $Year;
    public $Count;
    public $HospitalName;

    public function  MapFrom (array $data)
    {
        if(array_key_exists('ID',$data))
        {
            $this->ID = $data["ID"];
        }

        if(array_key_exists('name_hosp',$data))
        {
            $this->HospitalName = $data["name_hosp"];
        }

        if(array_key_exists('hospitalId',$data))
        {
            $this->HospitalId = $data["hospitalId"];
        }

        if(array_key_exists('month',$data))
        {
            $this->Month = $data["month"];
        }

        if(array_key_exists('year',$data))
        {
            $this->Year = $data["year"];
        }
        if(array_key_exists('count',$data))
        {
            $this->Count = $data["count"];
        }

        return $this;
    }
}