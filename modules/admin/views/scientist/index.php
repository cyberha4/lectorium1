<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ScientistSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Scientists';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="scientist-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Scientist', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],
    
                'id',
                //'name',
                [
                    //'filter' => \app\models\Scientist::getStatusesArray(),
                    'attribute' => 'image',
                    'value' => function ($model, $key, $index, $column) {
                        /** @var \app\models\Scientist $model */
                        $image = '<p><a href="lorem.html"><img src="'.$model->image.'" 
                                width="50" height="50" alt="lorem"></a></p>';
                        $name = $model->name;
                        return $image . $name;
                    },
                    'format' => 'html',
                ],
                'city',
                'achievements:ntext',
                [
                    //'filter' => \app\models\Scientist::getStatusesArray(),
                    'attribute' => 'biography',
                    //'value' => 'StatusName',
                    'options' => ['width' => '250'],

                ],
                [
                    'filter' => \app\models\Scientist::getStatusesArray(),
                    'attribute' => 'status',
                    'value' => 'StatusName',
                ],
                
                ['class' => 'yii\grid\ActionColumn'],
            ],
        ]); ?>
</div>
