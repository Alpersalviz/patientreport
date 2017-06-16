<?php
/**
 * Created by PhpStorm.
 * User: AlperSalviz
 * Date: 21.3.2017
 * Time: 00:01
 */

namespace AppBundle\Controller;
use AppBundle\Data\Model\Hospital;
use AppBundle\Data\Repository\HospitalRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route(service="app.hospital_controller")
 */
class HospitalController extends BaseController
{
    private $_hospitalRepo;

    function __construct(HospitalRepository $hospitalRepository)
    {
        $this->_hospitalRepo = $hospitalRepository;

    }
    /**
     * @Route("/hospital/list", name="hospital_list")
     * @Template("AppBundle:Hospital:list.html.twig")
     */
    public function indexAction(Request $request)
    {
        $limit = intval($request->get('limit',5));
        $page = intval($request->get('page',0));

        $searchKey = $request->get('searchKey',null);
       
        $hospital = $this->_hospitalRepo->GetHospital($page*$limit,$limit,$searchKey);

        return array(
            'hospital' => $hospital
        );
    }

    /**
     * @Route("/hospital/add", name="hospital_add")
     * @Template("AppBundle:Hospital:add.html.twig")
     */
    public function HospitalAddAction(Request $request)
    {
        $cities = $this->_hospitalRepo->GetAllCity();

        return array(
            'cities' => $cities
        );
    }

    /**
     * @Route("ajax/hospital/add", name="ajax_hospital_add")
     */
    public function AjaxHospitalAddAction(Request $request)
    {
        $data = $request->request->all();
        $hospital = new Hospital();

        $hospital->NameOfHosp  = $data["hospitalName"];
        $hospital->CityOfHosp  = $data["city"];

       $save =  $this->_hospitalRepo->SaveHospital($hospital);

        if ($save === false)
            return new JsonResponse(array(
                'success' => false
            ));

        return new JsonResponse(array(
            'success' => true
        ));
    }
    /**
     * @Route("/hospital/edit", name="hospital_edit")
     * @Template("AppBundle:Hospital:edit.html.twig")
     */
    public function hospitalEditAction(Request $request)
    {

        return array();
    }
}