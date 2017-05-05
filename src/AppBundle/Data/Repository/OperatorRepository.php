<?php
namespace AppBundle\Data\Repository;


use AppBundle\Data\Model\User;

class OperatorRepository extends BaseRepository
{

    public function LoginUser($name,$password){

        $query="SELECT * 
                FROM user
                WHERE username = :username AND password_op = :password_op";

        $result = $this->getConnection()->prepare($query);
        $result->execute(array(
            ':username' => $name,
            ':password_op' => $password
        ));

        $result = $result->fetch();

        if ($result == false)
            return false;


        $user = (new User())->MapFrom($result);

        return $user;
    }


}
