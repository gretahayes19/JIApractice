import {combineReducers} from "redux"
import teasReducer from './teas_reducer'

const rootReducer = (state, action) => {
    debugger
    return {
        teas: teasReducer(state.teas, action),
        // cookies: cookiesReducer(state.cookies, action)
    }
}

// const rootReducer = combineReducers({
//     teas: teasReducer
// })

export default rootReducer;