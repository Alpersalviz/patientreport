<?php

namespace AppBundle\Controller;

use AppBundle\Data\Repository\HospitalRepository;
use AppBundle\Data\Repository\OperatorRepository;
use AppBundle\Data\Repository\PatientRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;


/**
 * @Route(service="app.default_controller")
 */
class DefaultController extends BaseController
{

    private $_patientRepo;
    private $_hospitalRepo;
    private $_userRepository;

    function __construct(PatientRepository $patientRepository, HospitalRepository $hospitalRepository,OperatorRepository $operatorRepository)
    {
        $this->_patientRepo = $patientRepository;
        $this->_hospitalRepo = $hospitalRepository;
        $this->_userRepository = $operatorRepository;

    }
    /**
     * @Route("/", name="homepage")
     * @Template("AppBundle:Default:index.html.twig")
     */
    public function indexAction(Request $request)
    {

        $implantCount = $this->_patientRepo->GetImplantCount();
 
        // replace this example code with whatever you need
        return array(
            'implantCount'=> $implantCount
        );
    }
 
    /**
     *@Route("/login",name="login")
     *@Template("AppBundle:Default:login.html.twig")
     */
    public function LoginAction()
    {
        if ($this->GetSession()->get("id") != null)
            return $this->redirect("/");

        return array();
    }

    /**
     *@Route("/ajax/login",name="ajax_login")
     */
    public function AjaxLoginAction(Request $request)
    {
        $name = $request->request->get('username');
        $password = $request->request->get('password');
        $users = $this->_userRepository->LoginUser($name,$password); 

        if($users == false)
            return new JsonResponse (array(
                'success' => false
            ));


        $this->GetSession()->set('id',$users->ID);
        $this->GetSession()->set('name',$users->Username);

        return new JsonResponse (array(
            'success' => true
        ));

    }


    /**
     * @Route("/logout",name="logout")
     */
    public function LogoutAction()
    {
        $this->GetSession()->clear();
        return $this->redirect('/');

    }

}
