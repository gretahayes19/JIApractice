x1. Generating a new rails app
`rails new tea_time -G --database=postgresql --skip-turbolinks`

2. Migrations and models
`bundle exec rails g migration CreateTeas flavor:string amount:float`
`add_index :teas, :flavor, unique: true`

```rb
class Tea < ApplicationRecord
  validates :flavor, :amount, presence: true 
end
```

`bundle exec rails db:create`
`bundle exec rails db:migrate`
`bundle exec rails db:seed`

3. Controllers

api/teas_controller.rb
```rb
class Api::TeasController < ApplicationController
  def index
    teas = Tea.all
    render json: teas
  end

  def create
    tea = Tea.new(tea_params)

     if tea.save
      render json: tea
    else
      render json: tea.errors.full_messages, status: 422
    end
  end

  def tea_params
    params.require(:tea).permit(:flavor, :amount)
  end
end
```

static_pages_controller.rb
```rb
class StaticPagesController < ApplicationController
  def root
  end
end
```

4. Routes

```rb
namespace :api, defaults: { format: :json } do
  resources :teas, only: [:index, :create]
end

root to: 'static_pages#root'
```

5. Root View
view/static_pages/root.html.erb
```html
<main id="root">React is broken :(</main>
```

6. Webpack Config

```js
path: path.resolve(__dirname, 'app', 'assets', 'javascripts')
```

7. AJAX

Gemfile
`gem 'jquery-rails'`

application.js
`//= require jquery`

frontend/util/tea_api_util.js
```js
export const fetchAllTeas = () => {
  return $.ajax({
    url: `/api/teas`,
    method: `get`,
  });
};

export const createTea = (tea) => {
  return $.ajax({
    url: `/api/teas`,
    method: `post`,
    data: {
      tea: tea,
    },
  });
};
```

frontend/tea_shop.jsx
```js
import * as TeaAPIUtil from "./util/tea_api_util";
window.TeaAPIUtil = TeaAPIUtil;
```

8. Actions

```js
import * as TeaApiUtil from "../util/tea_api_util";

export const fetchAllTeas = () => dispatch => {
  return TeaApiUtil.fetchAllTeas()
    .then( teas => {
      return dispatch(receiveAllTeas(teas)) 
    });
};

export const createTea = (tea) => dispatch => {
  return TeaApiUtil.createTea(tea)
    .then( tea => {
      return dispatch(receiveTea(tea)) 
    });
};
```

9. Store

```js
import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import thunk from 'redux-thunk';

const configureStore = (preloadedState = {}) => {
  return createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(thunk, logger)
  );
}

export default configureStore;
```

10. Tea Index 

container
```js
const mapDispatchToProps = (dispatch) => {
  return {
    fetchAllTeas: () => {
      return dispatch(fetchAllTeas())
    }
  };
};
```

presentational
```js
  componentDidMount() {
    this.props.fetchAllTeas();
  }
```