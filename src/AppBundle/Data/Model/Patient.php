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
    public $LastnameOfPat;
    public $AdressOfPat;

    public $PhoneNumbers;



    public function  MapFrom(array $data)
    {
        $this->ID = $data['ID'];
        $this->PatientID = $data['patientID'];
        $this->OperatorID = $data['operatorID'];
        $this->TCKimlikNo = $data['tckimlikNo'];
        $this->FirstnameOfPat = $data['firstname_pat'];
        $this->LastnameOfPat = $data['lastname_pat'];
        $this->AdressOfPat = $data['adress_pat'];


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