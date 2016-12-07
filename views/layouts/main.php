<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">

         <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1        )    ; } </script>
            <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
            <link href="../css/style.css" rel='stylesheet' type='text/css' />
            <script src="../js/jquery-1.11.0.min.js"></script>
            <!--start-smoth-scrolling-->
            <script type="text/javascript" src="../js/move-top.js"></script>
            <script type="text/javascript" src="../js/easing.js"></script>
            <script type="text/javascript">
                    jQuery(document).ready(function($) {
                        $(".scroll").click(function(event){     
                            event.preventDefault();
                            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
                        });
                    });
        </script>

    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    
    <div class="header-bottom">
     <div class="fixed-header">
        <div class="container">
            <div class="top-menu">
                    <ul class="nav">
                        <li><a class="active hvr-bounce-to-right" href="/main/lecture">Лекции</a></li>
                        <li><a href="/scientist/" class="hvr-bounce-to-right">Ученые</a></li>
                        <li><a href="about.html" class="hvr-bounce-to-right">О нас</a></li>
                    </ul>   
                    <!-- script for menu -->
                        <script>
                        $( "span.menu" ).click(function() {
                          $( "ul.nav" ).slideToggle( "slow", function() {
                            // Animation complete.
                          });
                        });
                    </script>
                    <!-- script for menu -->
            </div>
            <script>
            // скрипт, который фиксирует навигационное меню на верху экрана
        /*$(document).ready(function() {
             var navoffeset=$(".header-bottom").offset().top;
             $(window).scroll(function(){
                var scrollpos=$(window).scrollTop(); 
                if(scrollpos >=navoffeset){
                    $(".header-bottom").addClass("fixed");
                }else{
                    $(".header-bottom").removeClass("fixed");
                }
             });
             
        });*/
        </script>
        </div>
     </div>
     </div>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
