<?php
namespace AppBundle\Data\Repository;


use AppBundle\Data\Model\Device;

class DeviceRepository extends BaseRepository
{
    public function GetAllDevice()
    {
        try{

            $query= 'SELECT *
                     FROM device';

            $result = $this->getConnection()->prepare($query);

            $result->execute();

            $results = $result->fetchAll();


            if($results == false)
                return false;

            $devices = array();

            foreach ($results as $result)
            {
                $devices[] = (new Device())->MapFrom($result);
            }

            return $devices;

        }catch (Exception $e)
        {
            return false;
        }

    }

    public function SaveDevice(Device $device)
    {
        try{

            if($device->DeviceID == 'null')
            {
                $query= "INSERT INTO 'device' 
                                ('HVADPumpID') 
                                VALUES (:HVADPumpID)";
            }else
            {

                $query = "UPDATE 'device' SET 
                         'HVADPumpID'=:HVADPumpID,
                         WHERE deviceID=.$this->getConnection()->quote($device->DeviceID)";
            }

            $result = $this->getConnection()->prepare($query);

            $result->execute(array(

                'HVADPumpID'       => $device->HVADPumpID

            ));
            if ($device->deviceID == null)
                $device->deviceID = intval($this->getConnection()->lastInsertId());


            if($result === false)
                return false;

            return true;

        }catch (Exception $e)
        {
            return false;
        }
    }

    public function DeleteDevice($deviceID)
    {
        try{
            $this->getConnection()->beginTransaction();
            $query = 'DELETE 
                  FROM device 
                  WHERE deviceID = '.$deviceID;

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