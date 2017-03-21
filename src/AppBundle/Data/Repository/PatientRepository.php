<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 17/03/17
 * Time: 16:43
 */

namespace AppBundle\Data\Repository;

use AppBundle\Data\Model\Patient;


class PatientRepository extends BaseRepository
{

    public function GetAllPatient()
    {
        try{

            $query= 'SELECT *
                     FROM patient';

            $result = $this->getConnection()->prepare($query);
            $result->execute();

            if($result == false)
                return false;

            $results = $result->fetchAll();

            $patients = array();
            foreach ($results as $result)
            {
                $patients[] = (new Patient())->MapFrom($result);
            }

            return $patients;

        }catch (Exception $e)
        {
            return false;
        }

    }

    public function SavePatient(Patient $patient)
    {
        try{

            if($patient->PatientID == 'null')
            {
                $query= "INSERT INTO 'patient' 
                ('tckimlikNo','firstname_pat','lastname_pat','adress_pat') 
                                VALUES (:tckimlikNo, :firstname_pat, :lastname_pat, :adress_pat)";
            }else
            {

                $query = "UPDATE 'patient' SET 
                         'tckimlikNo'=:tckimlikNo,'firstname_pat'=:firstname_pat,'lastname_pat'=:lastname_pat,'adress_pat'=:adress_pat
                         WHERE patientID=.$this->getConnection()->quote($patient->PatientID)";
            }

            $result = $this->getConnection()->prepare($query);

                $result->execute(array(

                    'tckimlikNo'       => $patient->TCKimlikNo,
                    'firstname_pat'    => $patient->FirstnameOfPat,
                    'lastname_pat'     => $patient->LastnameOfPat,
                    'adress_pat'       => $patient->AdressOfPat

            ));
            if ($patient->PatientID == null)
                $patient->PatientID = intval($this->getConnection()->lastInsertId());


            if($result === false)
                return false;

            return true;

        }catch (Exception $e)
        {
            return false;
        }
    }

    public function DeletePatient($patientID)
    {
        try{
            $this->getConnection()->beginTransaction();
            $query = 'DELETE 
                  FROM patient 
                  WHERE patientID = '.$patientID;

            $result = $this->getConnection()->prepare($query);
            $result->execute();

            if($result === false)
                return false;
            $this->getConnection()->commit();

            return true;
        }catch (Exception $e)
        {
          return false;
        }
    }

}