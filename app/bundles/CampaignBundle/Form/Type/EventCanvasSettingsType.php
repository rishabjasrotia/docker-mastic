<?php

namespace Mautic\CampaignBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\FormBuilderInterface;

class EventCanvasSettingsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder->add('droppedX', HiddenType::class);

        $builder->add('droppedY', HiddenType::class);
    }

    /**
     * @return string
     */
    public function getBlockPrefix()
    {
        return 'campaignevent_canvassettings';
    }
}
