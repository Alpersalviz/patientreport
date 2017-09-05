<?php
/**
 * Created by PhpStorm.
 * User: AlperSalviz
 * Date: 11.4.2017
 * Time: 15:05
 */

namespace AppBundle\Domain\Model;


class PagedList
{
    public $Content;
    public $ListSize;
    public $Limit;
    public $SearchKey;
    public $HospitalId;
    public $FirstMonth;
    public $LastMonth;
    public $Year;
    public $ImplantType;

    public function __construct($content = null, $listSize = null , $limit = null , $searchKey = null, $hospitalId = null,$firstmonth,$lastmonth,$year,$implant_type)
    {
        $this->Content = $content;
        $this->Limit = $limit;
        $this->ListSize = $listSize;
        $this->SearchKey = $searchKey;
        $this->HospitalId = $hospitalId;
        $this->FirstMonth = $firstmonth;
        $this->LastMonth = $lastmonth;
        $this->Year = $year;
        $this->ImplantType = $implant_type;
    }

}