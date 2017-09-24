<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 17/03/17
 * Time: 16:43
 */

namespace AppBundle\Data\Repository;

use AppBundle\Data\Model\HospitalReport;
use AppBundle\Data\Model\MonthCountReport;
use AppBundle\Data\Model\MontlyImplant;
use AppBundle\Data\Model\Patient;
use AppBundle\Data\Model\Implant;
use AppBundle\Domain\Model\PagedList;
use Symfony\Component\Config\Definition\Exception\Exception;


class PatientRepository extends BaseRepository
{

    public function GetAllPatient()
    {
        try {

            $query = 'SELECT *
                     FROM patient';

            $result = $this->getConnection()->prepare($query);
            $result->execute();

            if ($result == false)
                return false;

            $results = $result->fetchAll();

            $patients = array();
            foreach ($results as $result) {
                $patients[] = (new Patient())->MapFrom($result);
            }

            return $patients;

        } catch (Exception $e) {
            return false;
        }

    }

    public function SavePatient(Patient $patient)
    {
        try {

            if ($patient->PatientID == 'null') {
                $query = "INSERT INTO 'patient' 
                ('tckimlikNo','firstname_pat','lastname_pat','adress_pat') 
                                VALUES (:tckimlikNo, :firstname_pat, :lastname_pat, :adress_pat)";
            } else {

                $query = "UPDATE 'patient' SET 
                         'tckimlikNo'=:tckimlikNo,'firstname_pat'=:firstname_pat,'lastname_pat'=:lastname_pat,'adress_pat'=:adress_pat
                         WHERE patientID=.$this->getConnection()->quote($patient->PatientID)";
            }

            $result = $this->getConnection()->prepare($query);

            $result->execute(array(

                'tckimlikNo' => $patient->TCKimlikNo,
                'firstname_pat' => $patient->FirstnameOfPat,
                'lastname_pat' => $patient->LastnameOfPat,
                'adress_pat' => $patient->AdressOfPat

            ));
            if ($patient->PatientID == null)
                $patient->PatientID = intval($this->getConnection()->lastInsertId());


            if ($result === false)
                return false;

            return true;

        } catch (Exception $e) {
            return false;
        }
    }

    public function DeletePatient($patientID)
    {
        try {
            $this->getConnection()->beginTransaction();
            $query = 'DELETE 
                  FROM patient 
                  WHERE patientID = ' . $patientID;

            $result = $this->getConnection()->prepare($query);
            $result->execute();

            if ($result === false)
                return false;
            $this->getConnection()->commit();

            return true;
        } catch (Exception $e) {
            return false;
        }
    }


    public function AddImplant(Implant $device, Patient $patient)
    { 
        try {
            $this->getConnection()->beginTransaction();

            $patientQuery = "INSERT INTO patient
                              (operatorID, tckimlikNo, firstname_pat, adress_pat,patientID,patientAge, patientWeight , patientGender, patientHistory , patientBsa)VALUES 
                              (:operatorID,:tckimlikNo,:firstname_pat,:adress_pat,:patientID,:patientAge, :patientWeight , :patientGender, :patientHistory , :patientBsa)";
            $patientResult = $this->getConnection()->prepare($patientQuery);
            $patientResult->execute(array(
                ':patientID' =>$patient->PatientID,
                ':operatorID' => 2,
                ':tckimlikNo' => $patient->TCKimlikNo,
                ':firstname_pat' => $patient->FirstnameOfPat,
                ':adress_pat' => $patient->AdressOfPat,
                ':patientAge' => $patient->PatientAge,
                ':patientWeight' => $patient->PatientWeight,
                ':patientGender' => $patient->PatientGender,
                ':patientHistory' => $patient->PatientHistory,
                ':patientBsa' => $patient->PatientBsa

            ));

            if ($patientResult == false)
                return false;

            $phoneQuery = "INSERT INTO phone_no_pat
                          (patientID, phone_no) VALUES";

            $numItems = count($patient->PhoneNumbers);
            $i = 0;

            foreach ($patient->PhoneNumbers as $phoneNumber) {
                if (++$i == $numItems) {
                    $phoneQuery .="('".$patient->PatientID."',".$phoneNumber->PhoneNumber.")";
                } else {
                    $phoneQuery .="('".$patient->PatientID."',".$phoneNumber->PhoneNumber."),";
                }

            }
            $phoneResult = $this->getConnection()->prepare($phoneQuery);
            $phoneResult->execute();

            if ($phoneResult === false)
                return false;

            $query = "INSERT INTO implant
                      (patientID, HVADPumpID, hospitalID, implant_date, status_date, patient_status, descr_dev_of_pat, stay_duration_of_dev,qty,on_device,ex,tx,surgicalImplant,implantType,implant_type, surgeon, intermacsLevel, etiology, lavareCycle, cpbTime, pumpSpeed, pumpWatts, pumpFlow, pumpFlowSettling, referringClinician ,proctorName,outflowGraft, sterileSurgicalTools , drivelineExtensionCable , shoulderBag , showerBag,  batteryCharger ,batteryChargerACAdapter , dCAdaptor, mainController, backUpController ,main, backUp, batterySerial1, batterySerial2 ,batterySerial3 ,batterySerial4 ,batterySerial5 , batterySerial6 ,batterySerial7 ,batterySerial8 ,monitor ,monitorACAdapter ,outflowGraftRef, sterileSurgicalToolsRef , drivelineExtensionCableRef , shoulderBagRef , showerBagRef ,  batteryChargerRef ,batteryChargerACAdapterRef , dCAdaptorRef , mainControllerRef , backUpControllerRef , mainRef, backUpRef , batterySerial1Ref , batterySerial2Ref ,batterySerial3Ref ,batterySerial4Ref ,batterySerial5Ref , batterySerial6Ref ,batterySerial7Ref ,batterySerial8Ref ,monitorRef ,monitorACAdapterRef,pumpExchange,pumpExchangeDate ) VALUES 
                      (:patientID,:HVADPumpID,:hospitalID,:implant_date,:status_date,:patient_status,:descr_dev_of_pat,:stay_duration_of_dev,:qty,:on_device,:ex,:tx,:surgicalImplant, :implantType,:implant_type, :surgeon, :intermacsLevel, :etiology, :lavareCycle, :cpbTime, :pumpSpeed, :pumpWatts, :pumpFlow, :pumpFlowSettling, :referringClinician, :proctorName,:outflowGraft, :sterileSurgicalTools , :drivelineExtensionCable , :shoulderBag , :showerBag,  :batteryCharger ,:batteryChargerACAdapter , :dCAdaptor, :mainController, :backUpController , :main, :backUp, :batterySerial1, :batterySerial2 , :batterySerial3 , :batterySerial4 , :batterySerial5 , :batterySerial6 ,:batterySerial7 ,:batterySerial8 ,:monitor ,:monitorACAdapter , :outflowGraftRef, :sterileSurgicalToolsRef , :drivelineExtensionCableRef , :shoulderBagRef , :showerBagRef ,  :batteryChargerRef , :batteryChargerACAdapterRef , :dCAdaptorRef , :mainControllerRef , :backUpControllerRef , :mainRef, :backUpRef , :batterySerial1Ref , :batterySerial2Ref , :batterySerial3Ref , :batterySerial4Ref , :batterySerial5Ref , :batterySerial6Ref , :batterySerial7Ref , :batterySerial8Ref , :monitorRef , :monitorACAdapterRef , :pumpExchange ,:pumpExchangeDate)";

            $result = $this->getConnection()->prepare($query);
            $result->execute(array(
                ':patientID'            => $device->PatientID,
                ':HVADPumpID'           => $device->HVADPumpID,
                ':hospitalID'           => $device->HospitalID,
                ':implant_date'         => $device->ImplantDate,
                ':status_date'          => $device->StatusDate,
                ':patient_status'       => $device->PatientStatus,
                ':descr_dev_of_pat'     => $device->DescrDevOfPat,
                ':stay_duration_of_dev' => $device->StayDurationOfDev,
                ':qty'                  => $device->Qty,
                ':on_device'            => (int)$device->OnDevice,
                ':ex'                   => (int)$device->Ex,
                ':tx'                   => (int)$device->Tx,
                ':surgicalImplant'      => $device->SurgicalImplant,
                ':implantType'          => $device->ImplantType,
                ':implant_type'         => $device->Implant_Type,
                ':surgeon'              => $device->Surgeon,
                ':intermacsLevel'       => $device->IntermacsLevel,
                ':etiology'             => $device->Etiology,
                ':lavareCycle'          => $device->LavareCycle,
                ':cpbTime'              => $device->CpbTime,
                ':pumpSpeed'            => $device->PumpSpeed,
                ':pumpWatts'            => $device->PumpWatts,
                ':pumpFlow'             => $device->PumpFlow,
                ':pumpFlowSettling'     => $device->PumpFlowSettling,
                ':referringClinician'   => $device->ReferringClinician,
                ':proctorName'          => $device->ProctorName,
                ':outflowGraft'            => $device->OutflowGraf,
                ':sterileSurgicalTools'    => $device->SterileSurgicalTools,
                ':drivelineExtensionCable' => $device->DrivelineExtensionCable,
                ':shoulderBag'             => $device->ShoulderBag,
                ':showerBag'               => $device->ShowerBag,
                ':batteryCharger'          => $device->BatteryCharger,
                ':batteryChargerACAdapter' => $device->BatteryChargerACAdapter,
                ':dCAdaptor'               => $device->DCAdaptor,
                ':mainController'          => $device->MainController,
                ':batteryChargerACAdapter' => $device->BatteryChargerACAdapter,
                ':backUpController'        => $device->BackUpController,
                ':main'                    => $device->Main,
                ':backUp'                  => $device->BackUp,
                ':batterySerial1'          => $device->BatterySerial1,
                ':batterySerial2'          => $device->BatterySerial2,
                ':batterySerial3'          => $device->BatterySerial3,
                ':batterySerial4'          => $device->BatterySerial4,
                ':batterySerial5'          => $device->BatterySerial5,
                ':batterySerial6'          => $device->BatterySerial6,
                ':batterySerial7'          => $device->BatterySerial7,
                ':batterySerial8'          => $device->BatterySerial8,
                ':monitor'                 => $device->Monitor,
                ':monitorACAdapter'        => $device->MonitorACAdapter,
                ':outflowGraftRef'            => $device->OutflowGrafRef,
                ':sterileSurgicalToolsRef'    => $device->SterileSurgicalToolsRef,
                ':drivelineExtensionCableRef' => $device->DrivelineExtensionCableRef,
                ':shoulderBagRef'             => $device->ShoulderBagRef,
                ':showerBagRef'               => $device->ShowerBagRef,
                ':batteryChargerRef'          => $device->BatteryChargerRef,
                ':batteryChargerACAdapterRef' => $device->BatteryChargerACAdapterRef,
                ':dCAdaptorRef'               => $device->DCAdaptorRef,
                ':mainControllerRef'          => $device->MainControllerRef,
                ':batteryChargerACAdapterRef' => $device->BatteryChargerACAdapterRef,
                ':backUpControllerRef'        => $device->BackUpControllerRef,
                ':mainRef'                    => $device->MainRef,
                ':backUpRef'                  => $device->BackUpRef,
                ':batterySerial1Ref'          => $device->BatterySerial1Ref,
                ':batterySerial2Ref'          => $device->BatterySerial2Ref,
                ':batterySerial3Ref'          => $device->BatterySerial3Ref,
                ':batterySerial4Ref'          => $device->BatterySerial4Ref,
                ':batterySerial5Ref'          => $device->BatterySerial5Ref,
                ':batterySerial6Ref'          => $device->BatterySerial6Ref,
                ':batterySerial7Ref'          => $device->BatterySerial7Ref,
                ':batterySerial8Ref'          => $device->BatterySerial8Ref,
                ':monitorRef'                 => $device->MonitorRef,
                ':monitorACAdapterRef'        => $device->MonitorACAdapterRef,
                ':pumpExchange'               => $device->PumpExchange,
                ':pumpExchangeDate'           => $device->PumpExchangeDate
            ));

            if ($result == false)
                return false;

            $this->getConnection()->commit();
            return true;
        } catch (Exception $e) {
            $this->getConnection()->rollBack();
            return false;
        }

        return false;
    }
    public function UpdateImplant(Implant $device, Patient $patient)
    {
        try {
            $this->getConnection()->beginTransaction();

            $patientQuery = "UPDATE patient SET
                              operatorID = :operatorID, 
                              tckimlikNo = :tckimlikNo, 
                              firstname_pat = :firstname_pat, 
                              adress_pat = :adress_pat, 
                              patientID = :patientID,
                              patientAge = :patientAge,
                              patientWeight = :patientWeight,
                              patientGender = :patientGender,
                              patientHistory = :patientHistory,
                              patientBsa = :patientBsa
                              WHERE patientID = ".$this->getConnection()->quote($patient->PatientID);

            $patientResult = $this->getConnection()->prepare($patientQuery);
            $patientResult->execute(array(
                ':patientID' =>$patient->PatientID,
                ':operatorID' => 2,
                ':tckimlikNo' => $patient->TCKimlikNo,
                ':firstname_pat' => $patient->FirstnameOfPat,
                ':adress_pat' => $patient->AdressOfPat,
                ':patientAge' => $patient->PatientAge,
                ':patientWeight' => $patient->PatientWeight,
                ':patientGender' => $patient->PatientGender,
                ':patientHistory' => $patient->PatientHistory,
                ':patientBsa' => $patient->PatientBsa
            ));

            if ($patientResult == false)
                return false;
            $numItems = count($patient->PhoneNumbers);

            if($numItems > 0){
            $numItems = count($patient->PhoneNumbers);
            $i = 0;
            foreach ($patient->PhoneNumbers as $phoneNumber) {

                $phoneQuery = " UPDATE phone_no_pat SET patientID = '".$patient->PatientID."', phone_no =".$phoneNumber->PhoneNumber." WHERE phonenoID = ".$phoneNumber->PhoneNoID;

                $phoneResult = $this->getConnection()->prepare($phoneQuery);
                $phoneResult->execute();

                if ($phoneResult === false)
                    return false;
            }

            }

            $query = "UPDATE implant SET
                      patientID =  :patientID, 
                      HVADPumpID = :HVADPumpID, 
                      hospitalID = :hospitalID,
                      implant_date = :implant_date,
                      status_date = :status_date,
                      patient_status = :patient_status, 
                      descr_dev_of_pat = :descr_dev_of_pat, 
                      stay_duration_of_dev = :stay_duration_of_dev,
                      qty = :qty,
                      on_device = :on_device,
                      tx = :tx,
                      ex = :ex,
                      surgicalImplant = :surgicalImplant,
                      implantType = :implantType,
                      surgeon = :surgeon,
                      intermacsLevel = :intermacsLevel,
                      etiology = :etiology,
                      lavareCycle = :lavareCycle,
                      cpbTime = :cpbTime,
                      pumpSpeed = :pumpSpeed,
                      pumpWatts = :pumpWatts,
                      pumpFlow = :pumpFlow,
                      pumpFlowSettling = :pumpFlowSettling,
                      referringClinician = :referringClinician,
                      proctorName = :proctorName,
                      outflowGraft = :outflowGraft,
                      sterileSurgicalTools = :sterileSurgicalTools,
                      drivelineExtensionCable = :drivelineExtensionCable,
                      shoulderBag = :shoulderBag,
                      showerBag = :showerBag,
                      batteryCharger = :batteryCharger,
                      batteryChargerACAdapter = :batteryChargerACAdapter,
                      dCAdaptor = :dCAdaptor,
                      mainController = :mainController,
                      backUpController = :backUpController,
                      main = :main,
                      backUp = :backUp, 
                      batterySerial1 = :batterySerial1,
                      batterySerial2 = :batterySerial2,
                      batterySerial3 = :batterySerial3,
                      batterySerial4 = :batterySerial4,
                      batterySerial5 = :batterySerial5,
                      batterySerial6 = :batterySerial6,
                      batterySerial7 = :batterySerial7,
                      batterySerial8 = :batterySerial8,
                      monitor = :monitor,
                      monitorACAdapter = :monitorACAdapter,   
                      outflowGraftRef = :outflowGraftRef,
                      sterileSurgicalToolsRef = :sterileSurgicalToolsRef,
                      drivelineExtensionCableRef = :drivelineExtensionCableRef,
                      shoulderBagRef = :shoulderBagRef,
                      showerBagRef = :showerBagRef,
                      batteryChargerRef = :batteryChargerRef,
                      batteryChargerACAdapterRef = :batteryChargerACAdapterRef,
                      dCAdaptorRef = :dCAdaptorRef,
                      mainControllerRef = :mainControllerRef,
                      backUpControllerRef = :backUpControllerRef,
                      mainRef = :mainRef,
                      backUpRef = :backUpRef, 
                      batterySerial1Ref = :batterySerial1Ref,
                      batterySerial2Ref = :batterySerial2Ref,
                      batterySerial3Ref = :batterySerial3Ref,
                      batterySerial4Ref = :batterySerial4Ref,
                      batterySerial5Ref = :batterySerial5Ref,
                      batterySerial6Ref = :batterySerial6Ref,
                      batterySerial7Ref = :batterySerial7Ref,
                      batterySerial8Ref = :batterySerial8Ref,
                      monitorRef = :monitorRef,
                      monitorACAdapterRef = :monitorACAdapterRef,
                      pumpExchange = :pumpExchange,
                      pumpExchangeDate = :pumpExchangeDate
                      WHERE patientID = ".$this->getConnection()->quote($patient->PatientID);

            $result = $this->getConnection()->prepare($query);
           // var_dump($device->StatusDate);exit;
            $result->execute(array(
                ':patientID'            => $device->PatientID,
                ':HVADPumpID'           => $device->HVADPumpID,
                ':hospitalID'           => $device->HospitalID,
                ':implant_date'         => $device->ImplantDate,
                ':status_date'          => $device->StatusDate,
                ':patient_status'       => $device->PatientStatus,
                ':descr_dev_of_pat'     => $device->DescrDevOfPat,
                ':stay_duration_of_dev' => $device->StayDurationOfDev,
                ':qty'                  => $device->Qty,
                ':on_device'            => (int)$device->OnDevice,
                ':ex'                   => (int)$device->Ex,
                ':tx'                   => (int)$device->Tx,
                ':surgicalImplant'      => $device->SurgicalImplant,
                ':implantType'          => $device->ImplantType,
                ':surgeon'              => $device->Surgeon,
                ':intermacsLevel'       => $device->IntermacsLevel,
                ':etiology'             => $device->Etiology,
                ':lavareCycle'          => $device->LavareCycle,
                ':cpbTime'              => $device->CpbTime,
                ':pumpSpeed'            => $device->PumpSpeed,
                ':pumpWatts'            => $device->PumpWatts,
                ':pumpFlow'             => $device->PumpFlow,
                ':pumpFlowSettling'     => $device->PumpFlowSettling,
                ':referringClinician'   => $device->ReferringClinician,
                ':proctorName'          => $device->ProctorName,
                ':outflowGraft'            => $device->OutflowGraf,
                ':sterileSurgicalTools'    => $device->SterileSurgicalTools,
                ':drivelineExtensionCable' => $device->DrivelineExtensionCable,
                ':shoulderBag'             => $device->ShoulderBag,
                ':showerBag'               => $device->ShowerBag,
                ':batteryCharger'          => $device->BatteryCharger,
                ':batteryChargerACAdapter' => $device->BatteryChargerACAdapter,
                ':dCAdaptor'               => $device->DCAdaptor,
                ':mainController'          => $device->MainController,
                ':batteryChargerACAdapter' => $device->BatteryChargerACAdapter,
                ':backUpController'        => $device->BackUpController,
                ':main'                    => $device->Main,
                ':backUp'                  => $device->BackUp,
                ':batterySerial1'          => $device->BatterySerial1,
                ':batterySerial2'          => $device->BatterySerial2,
                ':batterySerial3'          => $device->BatterySerial3,
                ':batterySerial4'          => $device->BatterySerial4,
                ':batterySerial5'          => $device->BatterySerial5,
                ':batterySerial6'          => $device->BatterySerial6,
                ':batterySerial7'          => $device->BatterySerial7,
                ':batterySerial8'          => $device->BatterySerial8,
                ':monitor'                 => $device->Monitor,
                ':monitorACAdapter'        => $device->MonitorACAdapter,
                ':outflowGraftRef'            => $device->OutflowGrafRef,
                ':sterileSurgicalToolsRef'    => $device->SterileSurgicalToolsRef,
                ':drivelineExtensionCableRef' => $device->DrivelineExtensionCableRef,
                ':shoulderBagRef'             => $device->ShoulderBagRef,
                ':showerBagRef'               => $device->ShowerBagRef,
                ':batteryChargerRef'          => $device->BatteryChargerRef,
                ':batteryChargerACAdapterRef' => $device->BatteryChargerACAdapterRef,
                ':dCAdaptorRef'               => $device->DCAdaptorRef,
                ':mainControllerRef'          => $device->MainControllerRef,
                ':batteryChargerACAdapterRef' => $device->BatteryChargerACAdapterRef,
                ':backUpControllerRef'        => $device->BackUpControllerRef,
                ':mainRef'                    => $device->MainRef,
                ':backUpRef'                  => $device->BackUpRef,
                ':batterySerial1Ref'          => $device->BatterySerial1Ref,
                ':batterySerial2Ref'          => $device->BatterySerial2Ref,
                ':batterySerial3Ref'          => $device->BatterySerial3Ref,
                ':batterySerial4Ref'          => $device->BatterySerial4Ref,
                ':batterySerial5Ref'          => $device->BatterySerial5Ref,
                ':batterySerial6Ref'          => $device->BatterySerial6Ref,
                ':batterySerial7Ref'          => $device->BatterySerial7Ref,
                ':batterySerial8Ref'          => $device->BatterySerial8Ref,
                ':monitorRef'                 => $device->MonitorRef,
                ':monitorACAdapterRef'        => $device->MonitorACAdapterRef,
                ':pumpExchange'               => (int)$device->PumpExchange,
                ':pumpExchangeDate'           => $device->PumpExchangeDate
            ));

            if ($result == false)
                return false;

            $this->getConnection()->commit();
            return true;
        } catch (Exception $e) {
            $this->getConnection()->rollBack();
            return false;
        }

        return false;
    }

    public function GetImplant($offset = 0, $limit = 5, $searchKey = null, $hospitalId = null,$firstmonth,$secondmonth,$year,$implant_type = null)
    {


        try {
            $countQuery='SELECT COUNT(*) as row_count 
                FROM implant i 
                INNER JOIN patient p ON p.patientID = i.patientID 
                INNER JOIN hospital h ON h.ID = i.hospitalID';


            if($firstmonth == "0"){
                if($searchKey !== null && $searchKey !== 'search' || $hospitalId !== null && $hospitalId !== 'null' || $implant_type !== null &&  $implant_type !== 'null'){
                    $countQuery .=' WHERE ';
                }


                    if($searchKey !== null && $searchKey !== 'search')
                    {
                        $countQuery .='p.firstname_pat
                                LIKE "%'.$searchKey.'%" OR h.name_hosp LIKE "%'.$searchKey.'%"';
                    }


                if($hospitalId !== null && $hospitalId !== 'null' ){
                    if($searchKey !== null && $searchKey !== 'search')
                    {

                        $countQuery .= ' AND ';
                    }

                    $countQuery .='i.hospitalID = '.$hospitalId;
                }





                if($implant_type !== null && $implant_type !== 'null' ){
                    if($hospitalId !== null && $hospitalId !== 'null')
                    {

                        $countQuery .= ' AND ';
                    }

                    $countQuery .='i.implant_type = '.$implant_type;
                }
            }else{
                $countQuery .= " WHERE (implant_date BETWEEN '".$year."-".$firstmonth."-01' AND '".$year."-".$secondmonth."-31')";
                if ($hospitalId !== null && $hospitalId !== 'null') {

                    $countQuery .= 'AND i.hospitalID = ' . $hospitalId;
                }

                if ($implant_type !== null && $implant_type !== 'null') {

                    $countQuery .= 'AND i.implant_type = '.$implant_type;
                }
            }

            $countResult = $this->getConnection()->prepare($countQuery);
            $countResult->execute();
            $countResult = $countResult->fetch();

            if($countResult === null || (int)$countResult['row_count'] == 0)
                return new PagedList(null,0,$limit,$searchKey,$hospitalId,$firstmonth,$secondmonth,$year,$implant_type);

            $query = "SELECT i.*,p.*,h.name_hosp
                    FROM implant i 
                    INNER JOIN patient p ON p.patientID = i.patientID 
                    INNER JOIN hospital h ON h.ID = i.hospitalID";

            if($firstmonth == '0' ) {

                if ($searchKey !== null && $searchKey !== 'search' || $hospitalId !== null && $hospitalId !== 'null') {
                    $query .= ' WHERE ';
                }

                if ($searchKey !== null && $searchKey !== 'search') {
                    $query .= 'p.firstname_pat
                        LIKE "%' . $searchKey . '%" OR h.name_hosp LIKE "%' . $searchKey . '%"';
                }


                if ($hospitalId !== null && $hospitalId !== 'null') {

                    if ($searchKey !== null && $searchKey !== 'search') {

                        $query .= ' AND ';
                    }
                    $query .= 'i.hospitalID = ' . $hospitalId;
                }

                if($implant_type !== null && $implant_type !== 'null' ){
                    if($hospitalId !== null)
                    {

                        $query .= ' AND ';
                    }

                    $query .=' i.implant_type = '.$implant_type;
                }
            }else{
                $query .= " WHERE (implant_date BETWEEN '".$year."-".$firstmonth."-01' AND '".$year."-".$secondmonth."-31')";
                if ($hospitalId !== null && $hospitalId !== 'null') {

                    $query .= 'AND i.hospitalID = ' . $hospitalId;
                }
                if ($implant_type !== null && $implant_type !== 'null') {

                    $query .= 'AND i.implant_type = '.$implant_type;
                }

            }


            $query .=' LIMIT '.$offset.','.$limit;

            $result = $this->getConnection()->prepare($query);
            $result->execute();
            $results = $result->fetchAll();

            if($results == false)
                return new PagedList(null, 0,$limit,$searchKey,$hospitalId,$firstmonth,$secondmonth,$year,$implant_type);

            $phoneQuery="SELECT pnp.* 
                        FROM phone_no_pat pnp
                        WHERE pnp.patientID = :patientID";
            $resultPhone = $this->getConnection()->prepare($phoneQuery);
            $implant = array();

            foreach ($results as $result){

                $resultPhone->execute(array(
                    ':patientID' => $result["patientID"]
                ));
                $result["phoneNumbers"] = $resultPhone->fetchAll();

                $implant[] = (new Implant())->MapFrom($result);
            }
            $list = new PagedList($implant,(int)$countResult['row_count'],$limit,$searchKey,$hospitalId,$firstmonth,$secondmonth,$year,$implant_type);

            return $list;

        } catch (Exception $e) {
            return false;
        }



    }
    public function GetImplantByPatientId($patientID)
    {
        try {

            $query = "SELECT i.*,p.*,h.name_hosp
                    FROM implant i 
                    INNER JOIN patient p ON p.patientID = i.patientID 
                    INNER JOIN hospital h ON h.ID = i.hospitalID
                    WHERE p.patientID =".$this->getConnection()->quote($patientID);


            $result = $this->getConnection()->prepare($query);
            $result->execute();
            $results = $result->fetchAll();

            if($results == false)
                return false;

            $phoneQuery="SELECT pnp.* 
                        FROM phone_no_pat pnp
                        WHERE pnp.patientID = :patientID";
            $resultPhone = $this->getConnection()->prepare($phoneQuery);


            foreach ($results as $result){

                $resultPhone->execute(array(
                    ':patientID' => $result["patientID"]
                ));
                $result["phoneNumbers"] = $resultPhone->fetchAll();


            }

            $implant = (new Implant())->MapFrom($result);

            return $implant;

        } catch (Exception $e) {
            return false;
        }



    }

    public function UpdateImplantOnDevice()
    {
        try {
            $this->getConnection()->beginTransaction();
            $query = 'UPDATE implant SET 
                      status_date = NOW() 
                      WHERE on_device = 1 AND tx = 0 AND ex = 0 ';

            $result = $this->getConnection()->prepare($query);

            $result->execute();

            if ($result === false)
                return false;



            $queryDay = 'UPDATE implant SET 
                          stay_duration_of_dev = DATEDIFF(status_date, implant_date) 
                          WHERE on_device = 1  AND tx = 0 AND ex = 0 ';

            $resultDay = $this->getConnection()->prepare($queryDay);

            $resultDay->execute();

            if ($resultDay === false)
                return false;

            $this->getConnection()->commit();

            return true;
        } catch (Exception $e) {
            return false;
        }
    }

    public function GetImplantCount()
    {
        try {

            $query = "Select COUNT(*) AS implant_count 
                      FROM implant";

            $result = $this->getConnection()->prepare($query);
            $result->execute();
            $result = $result->fetch();

            if($result == false)
                return false;

            return $result;

        } catch (Exception $e) {
            return false;
        }
        
    }


    public function GetImplantMontlyReport($year=2017){
        try{


            $montlyQuery="SELECT SUM(countMonth) as countMonth , cmonth as Month, name_hosp, ID FROM
                            (
                            SELECT COUNT(i.ID) as countMonth, MONTH(i.implant_date) as cmonth , h.name_hosp as name_hosp , h.ID as ID
                              FROM implant i 
                              INNER JOIN hospital h ON h.ID = i.hospitalID
                              WHERE i.implant_date BETWEEN '".$year."-01-01 00:00:00' AND '".$year."-12-31 23:59:59' 
                              GROUP BY MONTH(i.implant_date) , h.name_hosp,h.ID
                            UNION ALL
                            SELECT COUNT(i.ID) as countMonth, MONTH(i.pumpExchangeDate) as cmonth , h.name_hosp as name_hosp , h.ID as ID
                              FROM implant i 
                              INNER JOIN hospital h ON h.ID = i.hospitalID
                              WHERE i.pumpExchange = 1  AND  i.pumpExchangeDate BETWEEN '".$year."-01-01 00:00:00' AND '".$year."-12-31 23:59:59'
                              GROUP BY MONTH(i.pumpExchangeDate) , h.name_hosp,h.ID
                            
                            ) report GROUP BY ID,cmonth,name_hosp";


            $result = $this->getConnection()->prepare($montlyQuery);
            $result->execute();

            if ($result == false)
                return false;

            $results = $result->fetchAll();


            $montlyImplant = array();
            foreach ($results as $result) {
                $montlyImplant[] = (new MontlyImplant())->MapFrom($result);
            }
            return $montlyImplant;

        }catch (Exception $e){
            return false;
        }
    }
    public function GetImplantHospitalReport($year){
        try{

            $montlyQuery="SELECT SUM(countHospital) as countHospital, name_hosp, ID FROM
                            (
                             SELECT COUNT(i.ID) as countHospital, h.name_hosp as name_hosp , h.ID as ID
                                FROM implant i 
                                INNER JOIN hospital h ON h.ID = i.hospitalID
                                WHERE i.implant_date BETWEEN '".$year."-01-01 00:00:00' AND '".$year."-12-31 23:59:59' 
                                GROUP BY h.name_hosp , h.ID
                              UNION ALL
                            SELECT COUNT(i.ID) as countHospital, h.name_hosp as name_hosp , h.ID as ID
                                FROM implant i 
                                INNER JOIN hospital h ON h.ID = i.hospitalID
                                WHERE i.pumpExchange = 1  AND i.pumpExchangeDate BETWEEN '".$year."-01-01 00:00:00' AND '".$year."-12-31 23:59:59' 
                                GROUP BY h.name_hosp , h.ID
    
                            
                            ) report GROUP BY ID,name_hosp";


            $result = $this->getConnection()->prepare($montlyQuery);
            $result->execute();

            if ($result == false)
                return false;

            $results = $result->fetchAll();

            $montlyImplant = array();
            foreach ($results as $result) {
                $montlyImplant[] = (new HospitalReport())->MapFrom($result);
            }
            return $montlyImplant;

        }catch (Exception $e){
            return false;
        }
    }

    public function GetImplantMountCountReport($year = 2015){
        try{


            $montlyQuery="SELECT SUM(countMonth) as countMonth , month FROM
                        (
                        SELECT COUNT(i.ID) as countMonth, MONTH(i.implant_date) as month
                            FROM implant i 
                            WHERE i.implant_date BETWEEN '".$year."-01-01 00:00:00' AND '".$year."-12-31 23:59:59' 
                            GROUP BY MONTH(i.implant_date)
                        
                          UNION ALL
                        
                        SELECT COUNT(i.ID) as countMonth, MONTH(i.pumpExchangeDate) as month
                            FROM implant i 
                            WHERE i.pumpExchange = 1  AND i.pumpExchangeDate BETWEEN '".$year."-01-01 00:00:00' AND '".$year."-12-31 23:59:59' 
                            GROUP BY MONTH(i.pumpExchangeDate)
                        
                        ) report GROUP BY month";

            $result = $this->getConnection()->prepare($montlyQuery);
            $result->execute();

            if ($result == false)
                return false;

            $results = $result->fetchAll();

            $montlyImplant = array();
            foreach ($results as $result) {
                $montlyImplant[] = (new MonthCountReport())->MapFrom($result);
            }
            return $montlyImplant;

        }catch (Exception $e){
            return false;
        }
    }


    public function GetImplantTotalCountReport($year = 2015){
        try{


            $montlyQuery="SELECT SUM(countMonth) as countMonth  FROM
                        (
                          SELECT COUNT(i.ID) as countMonth
                            FROM implant i 
                            WHERE i.implant_date BETWEEN '".$year."-01-01 00:00:00' AND '".$year."-12-31 23:59:59'
                        UNION ALL
                        SELECT COUNT(i.ID) as countMonth
                            FROM implant i 
                            WHERE  i.pumpExchange = 1   AND i.pumpExchangeDate BETWEEN '".$year."-01-01 00:00:00' AND '".$year."-12-31 23:59:59' 

                      )a";



            $result = $this->getConnection()->prepare($montlyQuery);
            $result->execute();

            if ($result == false)
                return false;

            $result = $result->fetch();


            return $result;

        }catch (Exception $e){
            return false;
        }
    }

    public function GetImplantMontlyReportMoth($year=2017,$month = 01){
        try{
            $montlyQuery="SELECT SUM(countMonth) as countMonth , cmonth as Month, name_hosp, ID FROM
                            (
                            SELECT COUNT(i.ID) as countMonth, MONTH(i.implant_date) as cmonth , h.name_hosp as name_hosp , h.ID as ID
                              FROM implant i 
                              INNER JOIN hospital h ON h.ID = i.hospitalID
                              WHERE i.implant_date BETWEEN '".$year."-".$month."-01 00:00:00' AND '".$year."-".$month."-31 23:59:59' 
                              GROUP BY MONTH(i.implant_date) , h.name_hosp,h.ID
                            UNION ALL
                            SELECT COUNT(i.ID) as countMonth, MONTH(i.pumpExchangeDate) as cmonth , h.name_hosp as name_hosp , h.ID as ID
                              FROM implant i 
                              INNER JOIN hospital h ON h.ID = i.hospitalID
                              WHERE i.pumpExchange = 1  AND  i.pumpExchangeDate BETWEEN '".$year."-".$month."-01 00:00:00' AND '".$year."-".$month."-31 23:59:59'
                              GROUP BY MONTH(i.pumpExchangeDate) , h.name_hosp,h.ID
                            
                            ) report GROUP BY ID,cmonth,name_hosp";


            $result = $this->getConnection()->prepare($montlyQuery);
            $result->execute();

            if ($result == false)
                return false;

            $results = $result->fetchAll();


            $montlyImplant = array();
            foreach ($results as $result) {
                $montlyImplant[] = (new MontlyImplant())->MapFrom($result);
            }
            return $montlyImplant;

        }catch (Exception $e){
            return false;
        }
    }


    public function GetImplantMountCountReportMonth($year = 2017,$month = 01){
        try{


            $montlyQuery="SELECT SUM(countMonth) as countMonth , month FROM
                        (
                        SELECT COUNT(i.ID) as countMonth, MONTH(i.implant_date) as month
                            FROM implant i 
                            WHERE i.implant_date BETWEEN '".$year."-".$month."-01 00:00:00' AND '".$year."-".$month."-31 23:59:59' 
                            GROUP BY MONTH(i.implant_date)
                        
                          UNION ALL
                        
                        SELECT COUNT(i.ID) as countMonth, MONTH(i.pumpExchangeDate) as month
                            FROM implant i 
                            WHERE i.pumpExchange = 1  AND i.pumpExchangeDate  BETWEEN '".$year."-".$month."-01 00:00:00' AND '".$year."-".$month."-31 23:59:59' 
                            GROUP BY MONTH(i.pumpExchangeDate)
                        
                        ) report GROUP BY month";

            $result = $this->getConnection()->prepare($montlyQuery);
            $result->execute();



            $result = $result->fetch();
            if ($result == false)
                return false;

                $montlyImplant = (new MonthCountReport())->MapFrom($result);

            return $montlyImplant;

        }catch (Exception $e){
            return false;
        }
    }
}