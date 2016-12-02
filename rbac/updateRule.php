<?php

namespace app\rbac;

use yii\rbac\Rule;
use Yii;

/**
 * Checks if authorID matches user passed via params
 */
class updateRule extends Rule
{
    public $name = 'updateOwnContent';

    const DEFAULT_RANK_VALUE = 10;

    /**
     * @param string|integer $user the user ID.
     * @param Item $item the role or permission that this rule is associated with
     * @param array $params parameters passed to ManagerInterface::checkAccess().
     * @return boolean a value indicating whether the rule permits the role or permission it is associated with.
     */
    public function execute($user, $item, $params)
    {
		if (!isset($params['user'])) {
			return false;
		}
		
		
        return true;
    }
}