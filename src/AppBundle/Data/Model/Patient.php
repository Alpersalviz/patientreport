<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 27.02.2017
 * Time: 22:03
 */

namespace AppBundle\Data\Model;


class Patient
{

    public $PatientID;
    public $OperatorID;
    public $TCKimlikNo;
    public $FirstnameOfPat;
    public $LastnameOfPat;
    public $AdressOfPat;


    public function  MapFrom(array $data)
    {
        $this->PatientID = $data['patientID'];
        $this->OperatorID = $data['operatorID'];
        $this->TCKimlikNo = $data['tckimlikNo'];
        $this->FirstnameOfPat = $data['firstname_pat'];
        $this->LastnameOfPat = $data['lastname_pat'];
        $this->AdressOfPat = $data['adress_pat'];

        return $this;
    }
}