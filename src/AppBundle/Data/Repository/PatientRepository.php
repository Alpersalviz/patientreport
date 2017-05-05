<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 17/03/17
 * Time: 16:43
 */

namespace AppBundle\Data\Repository;

use AppBundle\Data\Model\Patient;
use AppBundle\Data\Model\Implant;
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


    public function GetImplant()
    {
        $query = "SELECT 
                  dop.*
                  ,p.operatorID
                  ,p.tckimlikNo
                  ,p.firstname_pat
                  ,p.lastname_pat
                  ,p.adress_pat
                  ,d.HVADPumpID 
                  FROM device_of_patient dop 
                  INNER JOIN patient p ON dop.patientID = p.patientID 
                  INNER JOIN device d ON d.deviceID = dop.deviceID";

        return false;
    }

    public function AddImplant(Implant $device, Patient $patient)
    { 
        try {
            $this->getConnection()->beginTransaction();

            $patientQuery = "INSERT INTO patient
                              (operatorID, tckimlikNo, firstname_pat, lastname_pat, adress_pat,patientID)VALUES 
                              (:operatorID,:tckimlikNo,:firstname_pat,:lastname_pat,:adress_pat,:patientID)";
            $patientResult = $this->getConnection()->prepare($patientQuery);
            $patientResult->execute(array(
                ':patientID' =>$patient->PatientID,
                ':operatorID' => 2,
                ':tckimlikNo' => $patient->TCKimlikNo,
                ':firstname_pat' => $patient->FirstnameOfPat,
                ':lastname_pat' => $patient->LastnameOfPat,
                ':adress_pat' => $patient->AdressOfPat
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
                      (patientID, HVADPumpID, hospitalID, implant_date, status_date, patient_status, descr_dev_of_pat, stay_duration_of_dev,qty) VALUES 
                      (:patientID,:HVADPumpID,:hospitalID,:implant_date,:status_date,:patient_status,:descr_dev_of_pat,:stay_duration_of_dev,:qty)";

            $result = $this->getConnection()->prepare($query);
            $result->execute(array(
                ':patientID' => $device->PatientID,
                ':HVADPumpID' => $device->HVADPumpID,
                ':hospitalID' => $device->HospitalID,
                ':implant_date' => $device->ImplantDate,
                ':status_date' => $device->StatusDate,
                ':patient_status' => $device->PatientStatus,
                ':descr_dev_of_pat' => $device->DescrDevOfPat,
                ':stay_duration_of_dev' => $device->StayDurationOfDev,
                ':qty' => $device->Qty
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

}