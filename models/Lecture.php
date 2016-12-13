<?php

namespace app\models;

use Yii;
use app\models\Scientist;
use yii\web\NotFoundHttpException;

/**
 * This is the model class for table "lecture".
 *
 * @property integer $id
 * @property string $title
 * @property string $body
 * @property integer $created_by
 * @property integer $created_at
 */
class Lecture extends \yii\db\ActiveRecord
{
    const STATUS_PROPOSED = 2;
    const STATUS_PUBLISHED = 1;
    const STATUS_REJECTED = 3;

    const TYPE_LECTURE = 1;
    const TYPE_BIOGRAPHY = 2;
    const TYPE_STORY = 3;
    const TYPE_INTERVIEW = 4;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'lecture';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['body'], 'string'],
            [['created_by'], 'required'],
            [['created_by', 'created_at'], 'integer'],
            [['title'], 'string', 'max' => 255],
            [['video_url'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'body' => 'Body',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
        ];
    }

    public function getScientist()
    {
        $id = $this->scientist_id;
        \c_log($id);
        if (
            ($model = Scientist::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested post does not exist.');
        }
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord OR $this->isAttributeChanged('video_url')) {
                //$this->video_url = $this->getOldAttribute('video_url');
                $array = explode('?v=', $this->video_url);
                if (isset($array[1])){
                    $this->video_url = $array[1];
                }
                //$this->setPassword($this->newPassword);
            }
            return true;
        }
        return false;
    }
}
