<?php
namespace AppBundle\Data\Model;


class Implant
{

    public $ID;
    public $PatientID;
    public $HVADPumpID;
    public $HospitalID;
    public $ImplantDate;
    public $StatusDate;
    public $PatientStatus;
    public $DescrDevOfPat;
    public $StayDurationOfDev;
    public $Qty;
    public $OnDevice;

    public function MapFrom (array $data)
    {
        $this->ID = $data['ID'];
        $this->PatientID = $data ['patientID'];
        $this->HVADPumpID = $data['HVADPumpID'];
        $this->HospitalID = $data ['hospitalID'];
        $this->ImplantDate = $data ['implant_date'];
        $this->StatusDate = $data ['status_date'];
        $this->PatientStatus = $data ['patient_status'];
        $this->DescrDevOfPat = $data ['desc_dev_of_pat'];
        $this->StayDurationOfDev = $data ['stay_duration_of_dev'];
        $this->Qty = $data ['qty'];
        $this->OnDevice = $data ['on_device'];

        return $this;

    }

}