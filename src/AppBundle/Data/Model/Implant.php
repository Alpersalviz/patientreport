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
    public $Tx;
    public $Ex;

    public $SurgicalImplant;
    public $ImplantType;
    public $Implant_Type;
    public $Surgeon;
    public $IntermacsLevel;
    public $Etiology;
    public $LavareCycle;
    public $CpbTime;
    public $PumpSpeed;
    public $PumpWatts;
    public $PumpFlow;
    public $PumpFlowSettling;
    public $ReferringClinician;
    public $ProctorName;

    public $OutflowGraf;
    public $SterileSurgicalTools;
    public $DrivelineExtensionCable;
    public $ShoulderBag;
    public $ShowerBag;
    public $BatteryCharger;
    public $BatteryChargerACAdapter;
    public $DCAdaptor;
    public $MainController;
    public $BackUpController;
    public $Main;
    public $BackUp;
    public $BatterySerial1;
    public $BatterySerial2;
    public $BatterySerial3;
    public $BatterySerial4;
    public $BatterySerial5;
    public $BatterySerial6;
    public $BatterySerial7;
    public $BatterySerial8;
    public $Monitor;
    public $MonitorACAdapter;

    public $OutflowGrafRef;
    public $SterileSurgicalToolsRef;
    public $DrivelineExtensionCableRef;
    public $ShoulderBagRef;
    public $ShowerBagRef;
    public $BatteryChargerRef;
    public $BatteryChargerACAdapterRef;
    public $DCAdaptorRef;
    public $MainControllerRef;
    public $BackUpControllerRef;
    public $MainRef;
    public $BackUpRef;
    public $BatterySerial1Ref;
    public $BatterySerial2Ref;
    public $BatterySerial3Ref;
    public $BatterySerial4Ref;
    public $BatterySerial5Ref;
    public $BatterySerial6Ref;
    public $BatterySerial7Ref;
    public $BatterySerial8Ref;
    public $MonitorRef;
    public $MonitorACAdapterRef;

    public $HospitalCenter;

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

    public $PumpExchange;
    public $PumpExchangeDate;


    /**
     * @param array $data
     * @return $this
     */
    public function MapFrom (array $data)
    {

        $this->ID = $data['ID'];
        $this->PatientID = $data ['patientID'];
        $this->HVADPumpID = $data['HVADPumpID'];
        $this->HospitalID = $data ['hospitalID'];
        $this->ImplantDate = $data ['implant_date'];
        $this->StatusDate = $data ['status_date'];
        $this->PatientStatus = $data ['patient_status'];
        $this->DescrDevOfPat = $data ['descr_dev_of_pat'];
        $this->StayDurationOfDev = $data ['stay_duration_of_dev'];
        $this->Qty = $data ['qty'];
        $this->OnDevice = $data ['on_device'];
        $this->Tx = $data["tx"];
        $this->Ex = $data["ex"];

        $this->SurgicalImplant = $data["surgicalImplant"];
        $this->ImplantType = $data["implantType"];
        $this->Implant_Type = $data["implant_type"];
        $this->Surgeon = $data["surgeon"];
        $this->IntermacsLevel = $data["intermacsLevel"];
        $this->Etiology = $data["etiology"];
        $this->LavareCycle = $data["lavareCycle"];
        $this->CpbTime = $data["cpbTime"];
        $this->PumpSpeed = $data["pumpSpeed"];
        $this->PumpWatts = $data["pumpWatts"];
        $this->PumpFlow = $data["pumpFlow"];
        $this->PumpFlowSettling = $data["pumpFlowSettling"];
        $this->ReferringClinician = $data["referringClinician"];
        $this->ProctorName = $data["proctorName"];

        $this->OutflowGraf = $data["outflowGraft"];

        $this->SterileSurgicalTools = $data["sterileSurgicalTools"];
        $this->DrivelineExtensionCable = $data["drivelineExtensionCable"];
        $this->ShoulderBag = $data["shoulderBag"];
        $this->ShowerBag = $data["showerBag"];
        $this->BatteryCharger = $data["batteryCharger"];
        $this->BatteryChargerACAdapter = $data["batteryChargerACAdapter"];
        $this->DCAdaptor = $data["dCAdaptor"];
        $this->MainController = $data["mainController"];
        $this->BackUpController = $data["backUpController"];
        $this->Main = $data["main"];
        $this->BackUp = $data["backUp"];
        $this->BatterySerial1 = $data["batterySerial1"];
        $this->BatterySerial2 = $data["batterySerial2"];
        $this->BatterySerial3 = $data["batterySerial3"];
        $this->BatterySerial4 = $data["batterySerial4"];
        $this->BatterySerial5 = $data["batterySerial5"];
        $this->BatterySerial6 = $data["batterySerial6"];
        $this->BatterySerial7 = $data["batterySerial7"];
        $this->BatterySerial8 = $data["batterySerial8"];
        $this->Monitor = $data["monitor"];



        if(array_key_exists('monitorACAdapter',$data)) {
            $this->MonitorACAdapter = $data["monitorACAdapter"];
        }

        $this->OutflowGrafRef = $data["outflowGraftRef"];
        $this->SterileSurgicalToolsRef = $data["sterileSurgicalToolsRef"];
        $this->DrivelineExtensionCableRef = $data["drivelineExtensionCableRef"];
        $this->ShoulderBagRef = $data["shoulderBagRef"];
        $this->ShowerBagRef = $data["showerBagRef"];
        $this->BatteryChargerRef = $data["batteryChargerRef"];
        $this->BatteryChargerACAdapterRef = $data["batteryChargerACAdapterRef"];

        if(array_key_exists('dCAdaptorRef',$data)) {
            $this->DCAdaptorRef = $data["dCAdaptorRef"];
        }
        $this->MainControllerRef = $data["mainControllerRef"];
        $this->BackUpControllerRef = $data["backUpControllerRef"];
        $this->MainRef = $data["mainRef"];
        $this->BackUpRef = $data["backUpRef"];
        $this->BatterySerial1Ref = $data["batterySerial1Ref"];
        $this->BatterySerial2Ref = $data["batterySerial2Ref"];
        $this->BatterySerial3Ref = $data["batterySerial3Ref"];
        $this->BatterySerial4Ref = $data["batterySerial4Ref"];
        $this->BatterySerial5Ref = $data["batterySerial5Ref"];
        $this->BatterySerial6Ref = $data["batterySerial6Ref"];
        $this->BatterySerial7Ref = $data["batterySerial7Ref"];
        $this->BatterySerial8Ref = $data["batterySerial8Ref"];
        $this->MonitorRef = $data["monitorRef"];
        $this->MonitorACAdapterRef = $data["monitorACAdapterRef"];




        if(array_key_exists('operatorID',$data)) {
            $this->OperatorID = $data['operatorID'];
        }
        if(array_key_exists('tckimlikNo',$data)) {
            $this->TCKimlikNo = $data['tckimlikNo'];
        }
        if(array_key_exists('firstname_pat',$data)) {
            $this->FirstnameOfPat = $data['firstname_pat'];
        }
        if(array_key_exists('adress_pat',$data)) {
            $this->AdressOfPat = $data['adress_pat'];
        }

        if(array_key_exists('name_hosp',$data)) {
            $this->HospitalCenter = $data['name_hosp'];
        }


        if(array_key_exists('patientAge',$data)) {
            $this->PatientAge = $data['patientAge'];
        }

        if(array_key_exists('patientWeight',$data)) {
            $this->PatientWeight = $data['patientWeight'];
        }

        if(array_key_exists('patientGender',$data)) {
            $this->PatientGender = $data['patientGender'];
        }

        if(array_key_exists('patientHistory',$data)) {
            $this->PatientHistory = $data['patientHistory'];
        }

        if(array_key_exists('patientBsa',$data)) {
            $this->PatientBsa = $data['patientBsa'];
        }

        $this->PhoneNumbers = array();
        if(array_key_exists('phoneNumbers',$data))
        {

            foreach ($data['phoneNumbers'] as $row)
            {
                $this->PhoneNumbers[] = (new PhoneNumberOfPat())->MapFrom($row);
            }
        }
        $this->PumpExchange = $data["pumpExchange"];

        $this->PumpExchangeDate = $data["pumpExchangeDate"];

        return $this;

    }

}