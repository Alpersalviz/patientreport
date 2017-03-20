<?php
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 27.02.2017
 * Time: 22:19
 */

namespace AppBundle\Data\Model;


class Device
{

    public $DeviceID;
    public $HVADPumpID;

    public function MapFrom (array $data)
    {
        $this->DeviceID = $data['deviceID'];
        $this->HVADPumpID = $data['HVADPumpID'];

        return $this;
    }
}