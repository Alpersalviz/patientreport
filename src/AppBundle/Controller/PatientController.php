<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 21/03/17
 * Time: 16:21
 */

namespace AppBundle\Controller;

use AppBundle\Data\Model\Patient;
use AppBundle\Data\Model\Implant;
use AppBundle\Data\Repository\HospitalRepository;
use AppBundle\Data\Repository\PatientRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;


/**
 * @Route(service="app.patient_controller")
 */
class PatientController extends BaseController
{
    private $_patientRepo;
    private $_hospitalRepo;

    function __construct(PatientRepository $patientRepository, HospitalRepository $hospitalRepository)
    {
        $this->_patientRepo = $patientRepository;
        $this->_hospitalRepo = $hospitalRepository;

    }
    /**
     * @Route("/patient/list", name="patient_list")
     * @Template("AppBundle:Patient:list.html.twig")
     */
    public function indexAction(Request $request)
    {
        $limit = intval($request->get('limit',20));
        $page = intval($request->get('page',0));

        $searchKey = $request->get('searchKey',null);

        $implant = $this->_patientRepo->GetImplant($page*$limit,$limit,$searchKey);
        return array(
            'implant' => $implant
        );
    }

    /**
     * @Route("/patient/add", name="patient_add")
     * @Template("AppBundle:Patient:add.html.twig")
     */
    public function patientAddAction(Request $request)
    {
        $implantCenter = $this->_hospitalRepo->GetAllHospital();

        return array(
            'implantCenter' => $implantCenter
        );
    }
    /**
     * @Route("ajax/patient/add", name="ajax_patient_add")
     */
    public function AjaxPatientAddAction(Request $request)
    {
        $device = $request->request->get('device');
        $patient = $request->request->get('patient');
       // var_dump($device);exit;
        $deviceOfPat = (new Implant())->MapFrom($device);




        $patientObj = (new Patient())->MapFrom($patient);
        $add = $this->_patientRepo->AddImplant($deviceOfPat,$patientObj);
 
        return new JsonResponse(array(
            'success' => $add
        ));
    }

    /**
     * @Route("/patient/edit/{id}", name="patient_edit")
     * @Template("AppBundle:Patient:edit.html.twig")
     */
    public function patientEditAction($id)
    {
        $implant = $this->_patientRepo->GetImplantByPatientId($id);
        $implantCenter = $this->_hospitalRepo->GetAllHospital();

        return array(
            'implant' => $implant,
            'implantCenter' => $implantCenter
        );
    }
    /**
     * @Route("ajax/patient/update", name="ajax_patient_update")
     */
    public function AjaxPatientUpdateAction(Request $request)
    {
        $device = $request->request->get('device');
        $patient = $request->request->get('patient');


        $deviceOfPat = (new Implant())->MapFrom($device);
        $patientObj = (new Patient())->MapFrom($patient);
//        var_dump($deviceOfPat->OutflowGraft);exit;

        $add = $this->_patientRepo->UpdateImplant($deviceOfPat,$patientObj);

        return new JsonResponse(array(
            'success' => $add
        ));
    }
}