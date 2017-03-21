<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 17/03/17
 * Time: 23:37
 */

namespace AppBundle\Data\Repository;


use AppBundle\Data\Model\Hospital;

class HospitalRepository extends BaseRepository
{
    public function GetAllHospital()
    {
        $query = "SELECT * FROM hospital";
        
        $result = $this->getConnection()->prepare($query);
        $result->execute();
        
        if($result == false)
            return false;
        
        $results = $result->fetchAll();
        
        $hospitals = array();
        foreach ($results as $result)
        {
            $hospitals[] = (new Hospital())->MapFrom($result);
        }
        return $hospitals;
    }

}