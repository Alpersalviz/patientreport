<?php

namespace AppBundle\Controller;

use AppBundle\Data\Repository\PatientRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;


/**
 * @Route(service="app.default_controller")
 */
class DefaultController extends BaseController
{

    private $_patientRepo;

    function __construct(PatientRepository $patientRepository)
    {
        $this->_patientRepo = $patientRepository;
    }
    /**
     * @Route("/", name="homepage")
     * @Template("AppBundle:Default:index.html.twig")
     */
    public function indexAction(Request $request)
    {
        $patients = $this->_patientRepoRepository->GetAllPatient();

        // replace this example code with whatever you need
        return array(
            'patients'=>$patients
        );
    }
}
