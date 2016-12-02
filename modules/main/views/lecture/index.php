<?php

use \yii\widgets\ListView;
use \yii\helpers\URL;

?>
<div class="main-lecture-index">
    <p>
        <div class="col-xs-12">
        <?= ListView::widget([
            'dataProvider' => $dataProvider,
            'layout' => '{items}{pager}',
            'itemOptions' => ['class' => 'item'],
            'itemView' => '_view'
        ]) ?>
    </div>

    </p>

</div>
