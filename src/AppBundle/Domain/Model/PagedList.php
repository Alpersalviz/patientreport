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

    public function __construct($content = null, $listSize = null , $limit = null , $searchKey = null, $hospitalId = null)
    {
        $this->Content = $content;
        $this->Limit = $limit;
        $this->ListSize = $listSize;
        $this->SearchKey = $searchKey;
        $this->HospitalId = $hospitalId;
    }

}