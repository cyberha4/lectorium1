<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\commands;

use yii\console\Controller;

/**
 * This command echoes the first argument that you have entered.
 *
 * This command is provided as an example for you to learn how to create console commands.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class HelloController extends Controller
{
    /**
     * This command echoes what you have entered as the message.
     * @param string $message the message to be echoed.
     */
    public function actionIndex($message = 'hello world')
    {
        set_time_limit (0);

		$address = '127.0.0.1';

		$port = 7766;
		$con = 1;
		$word = "";

		$sock = socket_create(AF_INET, SOCK_STREAM, 0);
		$bind = socket_bind($sock, $address, $port);

		socket_listen($sock);

while ($con == 1)
{
    $client = socket_accept($sock);
    $input = socket_read($client, 2024);

    if ($input == 'exit') 
    {
        $close = socket_close($sock);
        $con = 0;
    }

    if($con == 1)
    {
        $word .= $input;
    }
}

echo $word;

    }
	
	public function parseRequest ($request = '') 
	{
		if ($request === '') {
			$this->runAction();
		}
		$parseRequest = explode("/", $request);
	}
	
	public function runAction($action = 'default')
	{
		if ($action === 'default') {
			
		}
	}
}


