<?php
/**
 * Created by PhpStorm.
 * User: AlperSalviz
 * Date: 16.4.2017
 * Time: 21:47
 */

namespace AppBundle\Domain\Helper;

use AppBundle\Data\Repository\CompetitorRepository;
use AppBundle\Data\Repository\PatientRepository;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\RequestStack;

class GenericHelper extends \Twig_Extension
{

    private $_container;
    private $_requestStack;
    private $_patientRepository;
    private $_competitorRepository;

    public function __construct(ContainerInterface $container, RequestStack $requestStack, PatientRepository $patientRepository, CompetitorRepository $competitorRepository)
    {
        $this->_container = $container;
        $this->_requestStack = $requestStack;
        $this->_patientRepository = $patientRepository;
        $this->_competitorRepository = $competitorRepository;
    }

    public function getFunctions()
    {
        return array(
            new \Twig_SimpleFunction('getMonthReport', array($this, 'getMonthReport')),
            new \Twig_SimpleFunction('getMonthCountReport', array($this, 'getMonthCountReport')),
            new \Twig_SimpleFunction('getMonthReportCompetitor', array($this, 'getMonthReportCompetitor')),
            new \Twig_SimpleFunction('getTotalCountCompetitor', array($this, 'getTotalCountCompetitor')),
        );
    }

    public function getMonthReport($month,$hospital,$year){

        $monthReport = $this->_patientRepository->GetImplantMontlyReport($year);
        foreach ($monthReport as $report){
            if($report->HospitalId == $hospital and $report->Month == $month){
                return $report;
            }
        }
       return false;

    }

    public function getMonthReportCompetitor($month,$hospital,$year){

        $monthReport = $this->_competitorRepository->GetCompetitorByYear($year);
        foreach ($monthReport as $report){
            if($report->HospitalId == $hospital and $report->Month == $month){
                return $report;
            }
        }
        return false;

    }



    public function getTotalCountCompetitor($year,$month){

        $monthReport = $this->_competitorRepository->GetTotalCountCompetitor($year);

        foreach ($monthReport as $report){
            if($report->Month == $month){
                return $report;
            }
        }
        return false;

    }

    public function getMonthCountReport($year=2015,$month){

        $monthReport = $this->_patientRepository->GetImplantMountCountReport($year);

        foreach ($monthReport as $report){
            if($report->Month == $month){
                return $report;
            }
        }
        return false;

    }



}