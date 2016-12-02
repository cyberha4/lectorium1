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
    <div class = 'table-responsive'>
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],
    
                'id',
                'name',
                'city',
                'biography:ntext',
                'achievements:ntext',
                [
                    'filter' => \app\models\Scientist::getStatusesArray(),
                    'attribute' => 'status',
                    'value' => function ($model, $key, $index, $column) {
                        /** @var \app\models\Scientist $model */
                        return $model->getStatusName();
                    }
                ],
                // 'image',
    
                ['class' => 'yii\grid\ActionColumn'],
            ],
        ]); ?>
    </div>
</div>
