<?php

use yii\helpers\Html;
use yii\widgets\ListView;
use yii\widgets\LinkPager;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ScientistSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Scientists';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="scientist-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php echo $this->render('_search', ['model' => $scientistSearch]); ?>
    <div class = 'row'>

    <?php
    //echo get_class ($dataProvider->pagination);
    echo LinkPager::widget([
    'pagination' => $array['pages'],
]);?>

<div>
<?php
    foreach ($array['models'] as $model) {
    // отображаем здесь $model
    	echo $this->render('_view', ['model' => $model]);
	}
?>
	<div>

    </div>
</div>
