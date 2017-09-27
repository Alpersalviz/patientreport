<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 17/03/17
 * Time: 23:37
 */

namespace AppBundle\Data\Repository;


use AppBundle\Data\Model\City;
use AppBundle\Data\Model\Competitor;
use AppBundle\Data\Model\Hospital;
use AppBundle\Domain\Model\PagedList;
use Symfony\Component\Config\Definition\Exception\Exception;

class CompetitorRepository extends BaseRepository
{
    public function GetCompetitorByYear($year)
    {
        $query = "SELECT SUM(c.count) as count ,c.month as month , h.ID as hospitalId FROM competitor_about c
                    INNER JOIN  hospital h ON h.ID = c.hospitalId
                    WHERE c.year =".$year."
                    
                    GROUP BY  c.month, h.ID";

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetchAll();

        $competitors = array();
        foreach ($results as $result) {
            $competitors[] = (new Competitor())->MapFrom($result);
        }
        return $competitors;
    }


    public function GetCompetitorMonthByYear($year,$month)
    {
        $query = "SELECT SUM(c.count) as count ,c.month as month , h.ID as hospitalId FROM competitor_about c
                    INNER JOIN  hospital h ON h.ID = c.hospitalId
                    WHERE c.year =".$year." AND c.month = ".$month."
                    
                    GROUP BY  c.month, h.ID";

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetchAll();

        $competitors = array();
        foreach ($results as $result) {
            $competitors[] = (new Competitor())->MapFrom($result);
        }
        return $competitors;
    }

    public function GetCompetitorHospitalByYear($year)
    {
        $query = "Select  SUM(c.count) as count, h.name_hosp,c.hospitalId from competitor_about c
                    INNER JOIN  hospital h ON h.ID = c.hospitalId
                    WHERE c.year = ".$year."
                    GROUP BY  h.ID";

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetchAll();

        $competitors = array();
        foreach ($results as $result) {
            $competitors[] = (new Competitor())->MapFrom($result);
        }
        return $competitors;
    }

    public function GetCompetitorHospitaMonthlByYear($year,$month)
    {
        $query = "Select  SUM(c.count) as count, h.name_hosp,c.hospitalId from competitor_about c
                    INNER JOIN  hospital h ON h.ID = c.hospitalId
                    WHERE c.year = ".$year." AND c.month = ".$month."
                    GROUP BY  h.ID";

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetchAll();

        $competitors = array();
        foreach ($results as $result) {
            $competitors[] = (new Competitor())->MapFrom($result);
        }
        return $competitors;
    }


    public function GetTotalCountCompetitor($year)
    {
        $query = "SELECT SUM(c.count) as count ,c.month as month FROM competitor_about c
                    INNER JOIN  hospital h ON h.ID = c.hospitalId
                    WHERE c.year =".$year."  
                    GROUP BY  c.month";

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetchAll();

        $competitors = array();
        foreach ($results as $result) {
            $competitors[] = (new Competitor())->MapFrom($result);
        }
        return $competitors;
    }

    public function GetTotalCountMonthCompetitor($year,$month)
    {
        $query = "SELECT SUM(c.count) as count ,c.month as month FROM competitor_about c
                    INNER JOIN  hospital h ON h.ID = c.hospitalId
                    WHERE c.year =".$year."  AND c.month = ".$month."
                    GROUP BY  c.month";

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetchAll();

        $competitors = array();
        foreach ($results as $result) {
            $competitors[] = (new Competitor())->MapFrom($result);
        }
        return $competitors;
    }

    public function GetCountCompetitor($year)
    {
        $query = "Select SUM(c.count) as count from competitor_about c
                  WHERE c.year =".$year;

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetch();

        return $results;
    }

    public function GetCountMothCompetitor($year,$month)
    {
        $query = "Select SUM(c.count) as count from competitor_about c
                  WHERE c.year =".$year." AND c.month = ".$month;

        $result = $this->getConnection()->prepare($query);
        $result->execute();

        if ($result == false)
            return false;

        $results = $result->fetch();

        return $results;
    }





    public function SaveCompetitor($competitors)
    {

        foreach ($competitors as $competitor){

            if ($competitor->ID != null) {
                $query = "UPDATE competitor_about SET 
                    hospitalId = :hospitalId, month = :month , year = :year, count = :count
                    WHERE ID = " . $this->getConnection()->quote($competitor->ID);
            } else {
                $query = "INSERT INTO 
                competitor_about(hospitalId, month,year,count)
                VALUES  (:hospitalId, :month,:year,:count)";
            }
            $result = $this->getConnection()->prepare($query);

            $result->execute(array(
                ':hospitalId' => $competitor->HospitalId,
                ':month' => $competitor->Month,
                ':year' => $competitor->Year,
                ':count' => $competitor->Count
            ));


            if ($result == false)
                return false;

        }
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


}