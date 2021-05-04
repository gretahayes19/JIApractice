import { RECEIVE_TEA, RECEIVE_ALL_TEAS } from '../actions/tea_actions'

const teas = {
    1: {
        id: 1,
        flavor: "oolong",
        amount: 2.75
    },
    2: {
        id: 2,
        flavor: 'jasmine',
        amount: 2
    },
    3: {
        id: 3,
        flavor: 'green',
        amount: 4
    }
}

const teasReducer = (state = teas, action) => {

    //we don't want to mutate the old state in the reducer
    Object.freeze(state);

    //we create a copy of the state to modify
    const nextState = Object.assign({}, state);
    // debugger
    switch (action.type) {
        case RECEIVE_TEA:
            // debugger
            nextState[action.tea.id] = action.tea;
            return nextState;
        case RECEIVE_ALL_TEAS:
            // debugger
            action.teas.forEach(tea => {
                nextState[tea.id] = tea
            })
            return nextState;
        default:
            // debugger
            return state;
    }
}

export default teasReducer;