<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 17/03/17
 * Time: 23:37
 */

namespace AppBundle\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

class BaseController extends Controller
{
    /**
     * @var Session
     */
    private $_session;

    public function Initialize(Session $session)
    {
        $this->_session = $session;

    }

    public function GetSession()
    {
        if(!$this->_session->isStarted())
        {
            $this->_session->start();
        }
        return $this->_session;
    }

}