<?php
/**
 * Created by PhpStorm.
 * User: AlperSalviz
 * Date: 21.3.2017
 * Time: 00:01
 */

namespace AppBundle\Controller;
use AppBundle\Data\Repository\HospitalRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
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
        //($hospital = $this->_hospitalRepo->GetAllHospital();
        // replace this example code with whatever you need
        return array();
    }

    /**
     * @Route("/hospital/add", name="hospital_add")
     * @Template("AppBundle:Hospital:add.html.twig")
     */
    public function hospitalAddAction(Request $request)
    {

        return array();
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