<?php

namespace app\controllers;

class MainpageController extends \yii\web\Controller
{
	public $layout = 'test2';
	
    public function actionIndex()
    {
        return $this->render('index');
    }

}
