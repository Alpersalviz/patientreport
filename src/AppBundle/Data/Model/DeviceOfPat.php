<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 27.02.2017
 * Time: 23:21
 */

namespace AppBundle\Data\Model;


class DeviceOfPat
{

    public $DeviceOfPatID;
    public $PatientID;
    public $DeviceID;
    public $HospitalID;
    public $ImplantDate;
    public $StatusDate;
    public $PatientStatus;
    public $DescrDevOfPat;
    public $StayDurationOfDev;
    public $DescrDate;

    public function MapFrom (array $data)
    {
        $this->DeviceOfPatID = $data['device_of_patientID'];
        $this->PatientID = $data ['patientID'];
        $this->DeviceID = $data ['deviceID'];
        $this->HospitalID = $data ['hospitalID'];
        $this->ImplantDate = $data ['implant_date'];
        $this->StatusDate = $data ['status_date'];
        $this->PatientStatus = $data ['patient_status'];
        $this->DescrDevOfPat = $data ['desc_dev_of_pat'];
        $this->StayDurationOfDev = $data ['stay_duration_of_dev'];
        $this->DescrDate = $data ['descr_date'];

        return $this;
    }
}