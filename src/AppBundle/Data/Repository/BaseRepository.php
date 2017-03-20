<?php
namespace AppBundle\Data\Repository;
/**
 * Created by PhpStorm.
 * User: gulcanertop
 * Date: 19.02.2017
 * Time: 23:28
 */
use Doctrine\DBAL\Connection;
use Monolog\Logger;

class BaseRepository
{


    private $_connection;

    public function Initialize(Connection $connection)
    {
        $this->_connection = $connection;
    }

    /**
     * @return \Doctrine\DBAL\Connection
     */
    public function getConnection()
    {
        return $this->_connection;
    }


}