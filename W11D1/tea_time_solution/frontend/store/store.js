import { createStore, applyMiddleware } from "redux";
// import teasReducer from "../reducers/teas_reducer"
import rootReducer from '../reducers/root_reducer'
import logger from 'redux-logger';
import thunk from 'redux-thunk';

//createStore takes 3 args: reducer, preloadedState, middleware

const configureStore = (preloadedState = {}) => {
    return createStore(
        rootReducer,
        preloadedState,
        applyMiddleware(thunk, logger)
    )
}

export default configureStore;