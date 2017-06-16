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
    public $ID;
    public $PatientID;
    public $OperatorID;
    public $TCKimlikNo;
    public $FirstnameOfPat;
    public $AdressOfPat;

    public $PatientAge;
    public $PatientWeight;
    public $PatientGender;
    public $PatientHistory;
    public $PatientBsa;



    public $PhoneNumbers;



    public function  MapFrom(array $data)
    {
        $this->ID = $data['ID'];
        $this->PatientID = $data['patientID'];
        $this->OperatorID = $data['operatorID'];
        $this->TCKimlikNo = $data['tckimlikNo'];
        $this->FirstnameOfPat = $data['firstname_pat'];
        $this->AdressOfPat = $data['adress_pat'];

        $this->PatientAge = $data['patientAge'];
        $this->PatientWeight = $data['patientWeight'];
        $this->PatientGender = $data['patientGender'];
        $this->PatientHistory = $data['patientHistory'];
        $this->PatientBsa = $data['patientBsa'];


        $this->PhoneNumbers = array();
        if(array_key_exists('phoneNumbers',$data))
        {

            foreach ($data['phoneNumbers'] as $row)
            {
                $this->PhoneNumbers[] = (new PhoneNumberOfPat())->MapFrom($row);
            }
        }

        return $this;
    }
}