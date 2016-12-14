<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Scientist;
use yii\data\Pagination;


/**
 * ScientistSearchFront represents the model behind the search form about `frontend\models\Scientist`.
 */
class ScientistSearchFront extends Scientist
{
    private $_where;
    public function __construct($where = ['status'=>Scientist::STATUS_ACTIVE], $config = [])
    {
        $this->_where = $where;
        parent::__construct($config);
    }

    public function rules()
    {
        return [
            [['id','status'], 'integer'],
            [['name', 'city', 'biography', 'achievements', 'image'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Scientist::find()->where(['status' => 1]);

        $this->load($params);

        $query->andFilterWhere([
            'id' => $this->id,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'city', $this->city])
            ->andFilterWhere(['like', 'biography', $this->biography])
            ->andFilterWhere(['like', 'achievements', $this->achievements])
            ->andFilterWhere(['like', 'image', $this->image]);

        $countQuery = clone $query;
        $pages = new Pagination([
                'totalCount' => $countQuery->count(),
                'defaultPageSize' => 8,
                ]);
        


        

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        

        $models = $query->offset($pages->offset)
            ->limit($pages->limit)
            ->all();

        return ['pages' => $pages, 'models' => $models];
    }
}
