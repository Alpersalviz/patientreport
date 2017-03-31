<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 21/03/17
 * Time: 16:21
 */

namespace AppBundle\Controller;
use AppBundle\Data\Repository\PatientRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Request;


/**
 * @Route(service="app.patient_controller")
 */
class PatientController extends BaseController
{
    private $_patientRepo;

    function __construct(PatientRepository $patientRepository)
    {
        $this->_patientRepo = $patientRepository;

    }
    /**
     * @Route("/patient/list", name="patient_list")
     * @Template("AppBundle:Patient:list.html.twig")
     */
    public function indexAction(Request $request)
    {
        //($patient = $this->_patientRepo->GetAllHospital();
        // replace this example code with whatever you need
        return array();
    }

    /**
     * @Route("/patient/add", name="patient_add")
     * @Template("AppBundle:Patient:add.html.twig")
     */
    public function patientAddAction(Request $request)
    {

        return array();
    }

    /**
     * @Route("/patient/edit", name="patient_edit")
     * @Template("AppBundle:Patient:edit.html.twig")
     */
    public function patientEditAction(Request $request)
    {

        return array();
    }

}