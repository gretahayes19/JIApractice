export const RECEIVE_TEA = "RECEIVE_TEA"
export const RECEIVE_ALL_TEAS = "RECEIVE_ALL_TEAS";
import * as TeaApiUtil from "../util/tea_api_util";

//static action
// export const receiveGreenTea = {
//     type: RECEIVE_TEA,
//     tea: {
//         flavor: 'green',
//         amount: 2.75,
//         id: 1
//     }
// };

//action creator
export const receiveTea = (tea) => {
    debugger
    return {
        type: RECEIVE_TEA,
        // tea: tea
        tea
    }
}

export const receiveAllTeas = (teas) => {
    return {
        type: RECEIVE_ALL_TEAS,
        teas
    }
};

export const fetchAllTeas = () => dispatch => {
    return TeaApiUtil.fetchTeas()
        .then(teas => {
            return dispatch(receiveAllTeas(teas))
        });
};

export const createTea = (tea) => dispatch => {
    return TeaApiUtil.createTea(tea)
        .then(tea => {
            return dispatch(receiveTea(tea))
        });
};