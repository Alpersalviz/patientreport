<?php

namespace AppBundle\Controller;

use AppBundle\Data\Repository\HospitalRepository;
use AppBundle\Data\Repository\PatientRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template; 
use Symfony\Component\HttpFoundation\Request;


/**
 * @Route(service="app.default_controller")
 */
class DefaultController extends BaseController
{

    private $_patientRepo;
    private $_hospitalRepo;

    function __construct(PatientRepository $patientRepository, HospitalRepository $hospitalRepository)
    {
        $this->_patientRepo = $patientRepository;
        $this->_hospitalRepo = $hospitalRepository;

    }
    /**
     * @Route("/", name="homepage")
     * @Template("AppBundle:Default:index.html.twig")
     */
    public function indexAction(Request $request)
    {
        $patients = $this->_patientRepo->GetAllPatient();
 
        // replace this example code with whatever you need
        return array();
    }

    /**
     * @Route("/gulcan", name="gulcanpage")
     * @Template("AppBundle:Default:index.html.twig")
     */
    public function indexHospAction(Request $request)
    {
        $results = $this->_hospitalRepo->GetAllHospital();

        var_dump($results);exit();
        // replace this example code with whatever you need
        return array();
    }

}
