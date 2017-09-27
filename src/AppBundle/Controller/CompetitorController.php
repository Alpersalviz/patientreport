<?php
/**
 * Created by PhpStorm.
 * User: AlperSalviz
 * Date: 21.3.2017
 * Time: 00:01
 */

namespace AppBundle\Controller;
use AppBundle\Data\Model\Competitor;
use AppBundle\Data\Model\Hospital;
use AppBundle\Data\Repository\CompetitorRepository;
use AppBundle\Data\Repository\HospitalRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route(service="app.competitor_controller")
 */
class CompetitorController extends BaseController
{
    private $_competitorRepo;
    private $_hospitalRepo;

    function __construct(CompetitorRepository $competitorRepository,HospitalRepository $hospitalRepository)
    {
        $this->_competitorRepo = $competitorRepository;
        $this->_hospitalRepo = $hospitalRepository;

    }

    /**
     * @Route("/competitor/add", name="competitor_add")
     * @Template("AppBundle:Competitor:save.html.twig")
     */
    public function HospitalAddAction(Request $request)
    {
       // $cities = $this->_hospitalRepo->GetAllCity();
        $hospitals = $this->_hospitalRepo->GetAllHospital();

        return array(
            //'cities' => $cities
            'hospitals' => $hospitals
        );
    }

    /**
     * @Route("ajax/competitor/add", name="ajax_competitor_add")
     */
    public function AjaxHospitalAddAction(Request $request)
    {
        $allData = $request->request->get('data');

        $competitor= array();

        foreach ($allData as $data){

            $competitor[] = (new Competitor())->MapFrom($data);
        }

        $competitorAdd = $this->_competitorRepo->SaveCompetitor($competitor);

        if ($competitorAdd === false)
            return new JsonResponse(array(
                'success' => false
            ));

        return new JsonResponse(array(
            'success' => true
        ));
    }



    /**
     *@Route("/competitor/year/{year}",name="year_competitor_report")
     *@Template("AppBundle:Competitor:year_competitor_report.html.twig")
     */
    public function YearReportAction($year)
    {
        $competitorReport = $this->_competitorRepo->GetCompetitorByYear($year);
        $hospitals = $this->_competitorRepo->GetCompetitorHospitalByYear($year);
        $totalCount =  $this->_competitorRepo->GetCountCompetitor($year);

        return array(
            'competitors' => $competitorReport,
            'hospitals' => $hospitals,
            'year'  => $year,
            'totalCount'  => $totalCount["count"]
        );
    }

    /**
     *@Route("/competitor/month/{year}/{month}",name="month_competitor_report")
     *@Template("AppBundle:Competitor:month_competitor_report.html.twig")
     */
    public function MonthReportAction($year,$month)
    {
        $competitorReport = $this->_competitorRepo->GetCompetitorMonthByYear($year,$month);
        $hospitals = $this->_competitorRepo->GetCompetitorHospitaMonthlByYear($year,$month);
        $totalCount =  $this->_competitorRepo->GetCountMothCompetitor($year,$month);

        return array(
            'competitors' => $competitorReport,
            'hospitals' => $hospitals,
            'year'  => $year,
            'totalCount'  => $totalCount["count"],
            'month' => $month
        );
    }
}