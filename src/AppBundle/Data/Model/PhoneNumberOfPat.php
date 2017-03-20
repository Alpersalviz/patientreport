<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 27.02.2017
 * Time: 22:45
 */

namespace AppBundle\Data\Model;


class PhoneNumberOfPat
{
    public $PhoneNoID;
    public $PatientID;
    public $PhoneNumber;

    public function MapFrom(array $data)
    {
        $this->PhoneNoID = $data['phonenoID'];
        $this->PatientID = $data ['patientID'];
        $this->PhoneNumber = $data ['phone_no'];

        return $this;
    }

}