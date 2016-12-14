<?php
use \yii\helpers\Html;
$this->params['test']++;
$test = $this->params['test'];
?>
<div class="col-xs-3">
	<?= Html::a('<img class="img-responsive" src=" '. Html::encode($model->image) .' " alt="Bad..">', 
						['scientist/view', 'id' => $model->id])	?>

	
	<?= Html::a(Html::encode($model->name), ['scientist/view', 'id' => $model->id], 
											['class' => 'profile-link']) ?>
</div>

