<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 17/03/17
 * Time: 23:37
 */

namespace AppBundle\Data\Repository;


use AppBundle\Data\Model\City;
use AppBundle\Data\Model\Hospital;
use AppBundle\Domain\Model\PagedList;
use Symfony\Component\Config\Definition\Exception\Exception;

class HospitalRepository extends BaseRepository
{
    public function GetAllHospital()
    {
        $query = "SELECT * FROM hospital";

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetchAll();

        $hospitals = array();
        foreach ($results as $result) {
            $hospitals[] = (new Hospital())->MapFrom($result);
        }
        return $hospitals;
    }
    public function GetAllCity()
    {
        $query = "SELECT * FROM city";

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetchAll();

        $cities = array();
        foreach ($results as $result) {
            $cities[] = (new City())->MapFrom($result);
        }
        return $cities;
    }

    public function SaveHospital(Hospital $hospital)
    {
        if ($hospital->ID != null) {
            $query = "UPDATE hospital SET 
                    name_hosp = :name_hosp, city_hosp = :city_hosp 
                    WHERE ID = " . $this->getConnection()->quote($hospital->ID);
        } else {
            $query = "INSERT INTO 
                hospital(name_hosp, city_hosp)
                VALUES  (:name_hosp, :city_hosp)";
        }


        $result = $this->getConnection()->prepare($query);
        $result->execute(array(
            ':name_hosp' => $hospital->NameOfHosp,
            ':city_hosp' => $hospital->CityOfHosp,
        ));

        if ($result == false)
            return false;

        return true;
    }

    public function GetHospitalById($id)
    {
        try {
            $query = "SELECT *
                 FROM hospital
                 WHERE ID =" . $id;

            $result = $this->getConnection()->prepare($query);
            $result->execute();

            if ($result == false)
                return false;

            $result = $result->fetch();

            $hospital = (new Hospital())->MapFrom($result);

            return $hospital;
        } catch (Exception $e) {
            return false;
        }
    }

    public function GetHospital($offset = 0, $limit = 5, $searchKey = null)
    {
        try {
            $countQuery='SELECT COUNT(*) as row_count 
                FROM hospital h';
            if($searchKey !== null)
            {
                $countQuery .=' WHERE h.name_hosp
                        LIKE "%'.$searchKey.'%" OR h.city_hosp LIKE "%'.$searchKey.'%"';
            }

            $countResult = $this->getConnection()->prepare($countQuery);
            $countResult->execute();
            $countResult = $countResult->fetch();
            if($countResult === null || (int)$countResult['row_count'] == 0)
                return new PagedList(null,0,$limit,$searchKey,null,null,null,null,null);

            $query = "SELECT h.*,c.city
                    FROM hospital h INNER JOIN city c ON h.city_hosp = c.ID";
            if($searchKey !== null){
                $query .=' WHERE h.name_hosp
                        LIKE "%'.$searchKey.'%" OR h.city_hosp LIKE "%'.$searchKey.'%"';
            }
            $query .=' LIMIT '.$offset.','.$limit;

            $result = $this->getConnection()->prepare($query);
            $result->execute();
            $results = $result->fetchAll();

            if($results == false)
                return new PagedList(null, 0,$limit,$searchKey,null,null,null,null,null);

            $hospital = array();

            foreach ($results as $result){
                $hospital[] = (new Hospital())->MapFrom($result);
            }

            $list = new PagedList($hospital,(int)$countResult['row_count'],$limit,$searchKey,null,null,null,null,null);

            return $list;

        } catch (Exception $e) {
            return false;
        }

    }

}