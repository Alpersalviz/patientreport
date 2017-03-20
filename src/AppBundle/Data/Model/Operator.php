<?php

namespace AppBundle\Data\Model;
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 27.02.2017
 * Time: 21:46
 */
class Operator
{
    public $OperatorID;
    public $Username;
    public $FistnameOfOp;
    public $LastnameOfOp;
    public $PasswordOfOp;

    public function MapFrom(array $data)
    {
        $this->OperatorID = $data['operatorID'];
        $this->Username = $data['username'];
        $this->FirstnameOfOp = $data['firstname_op'];
        $this->LastnameOfOp = $data ['lastname_op'];
        $this->PasswordOfOp = $data ['password_op'];

        return $this;
    }
}
