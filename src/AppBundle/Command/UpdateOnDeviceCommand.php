<?php
namespace AppBundle\Command;
use AppBundle\Data\Repository\PatientRepository;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;


/**
 * Created by PhpStorm.
 * User: alper
 * Date: 11.05.2017
 * Time: 12:33
 */
class UpdateOnDeviceCommand extends ContainerAwareCommand
{
    /**
     * {@inheritdoc}
     */
    protected function configure()
    {
        $this
            ->setName('app:device')
            ->setDescription('Webcast reminder for logged in users and invitations')
            ->addOption(
                'update',
                null,
                InputOption::VALUE_NONE,
                'Send email to loggedin and invited users.'
            );
    }


    /**
     * {@inheritdoc}
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        /** @var PatientRepository $patientService */
        $patientService = $this->getContainer()->get('app.patient_repository');

        if ($input->getOption('update')) {

            $patientDayUpdate = $patientService->UpdateImplantOnDevice();

            if ($patientService == true){
                echo 'Güncellendi';

            }else{
                echo 'Güncellenemedi'.PHP_EOL;
            }

        }



    }

}