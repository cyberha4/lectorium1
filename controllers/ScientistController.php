<?php

namespace app\controllers;

use Yii;
use app\models\Scientist;
use app\models\ScientistSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;

use yii\web\UploadedFile;
use yii\imagine\Image;

use Imagine\Gd;
use Imagine\Image\Box;
use Imagine\Image\BoxInterface;

/**
 * ScientistController implements the CRUD actions for Scientist model.
 */
class ScientistController extends Controller
{
    /**
     * @inheritdoc
     */

    private $_model;

    /**
     * Lists all Scientist models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Scientist::find()->where(['status'=>Scientist::STATUS_ACTIVE]),
            'pagination' => ['pageSize' => 10],
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Scientist model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('myview', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Finds the Scientist model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Scientist the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {

        \c_log(0);
        if ($this->_model === null) {
            \c_log(1);
            $this->_model = Scientist::findOne([
                'id' => $id,
                'status' => Scientist::STATUS_ACTIVE,
            ]);
        }
        if ($this->_model !== null) {
            return $this->_model;
        } 
        throw new NotFoundHttpException('The requested page does not exist.');

    }
}
