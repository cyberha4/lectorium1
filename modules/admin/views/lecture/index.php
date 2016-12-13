<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\lecturesearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Lectures';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lecture-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Lecture', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title',
            //'body:ntext',
            
            [
                'attribute' => 'body',
                'value' => function ($model, $key, $index, $column) {
                    //$value = $column->getDataCellValue($model, $key, $index);
                    return 123;//substr($model->body, 0, 45) . '...'; 
                },

            ],
            [
                //'filter' => DatePicker::widget([
                //    'model' => $searchModel,
                //    'attribute' => 'date_from',
                //    'attribute2' => 'date_to',
                //    'type' => DatePicker::TYPE_RANGE,
                //    'separator' => '-',
                //    'pluginOptions' => ['format' => 'yyyy-mm-dd']
                //]),
                'attribute' => 'created_at',
                'format' => 'datetime',
                'options' => ['width' => '250'],
            ],
            'created_by',
            //'created_at',
            'video_url:url',
            // 'type',
            // 'status',
            // 'annotation',
            // 'scientist_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
