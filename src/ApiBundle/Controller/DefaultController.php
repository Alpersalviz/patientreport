<?php

namespace ApiBundle\Controller;

use AppBundle\Controller\BaseController;
use AppBundle\Data\Repository\HospitalRepository;
use AppBundle\Data\Repository\OperatorRepository;
use AppBundle\Data\Repository\PatientRepository;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\BrowserKit\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route(service="api.default_controller")
 */
class DefaultController extends BaseController
{
    private $_hospitalRepo;

    function __construct(HospitalRepository $hospitalRepository)
    {
        $this->_hospitalRepo = $hospitalRepository;
    }

    /**
     * @Route("/", name="api_homepage")
     */
    public function apiIndexAction()
    {

           $implantCount = $this->_hospitalRepo->GetAllCity();

        // replace this example code with whatever you need
        return new JsonResponse(array(
            'name'=> $implantCount

        ));
    }
}
