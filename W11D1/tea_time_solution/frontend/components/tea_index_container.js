import { connect } from 'react-redux';
import TeaIndex from './tea_index';
import { receiveTea, fetchAllTeas } from '../actions/tea_actions';

const mSTP = (state) => { // this state is from redux! mSTP must be first
  const selectTeasByFlavor = (teas, flavor) => {
    const teasArray = Object.values(teas);
    return teasArray.filter(tea => tea.flavor === flavor)
  } // normally selectors would live in another file and be imported into container
  debugger

  // be semantic when defining keys in this slice of state
  return {
    teas: Object.values(state.teas),
    greenTeas: selectTeasByFlavor(state.teas, "green")
  }
}
//mDTP must be second
const mDTP = (dispatch) => { // contains functions for React components to use
  debugger
  return {
    receiveTea: (tea) => {
      debugger
      dispatch(receiveTea(tea))
    },
    fetchAllTeas: () => dispatch(fetchAllTeas())
  }
}

export default connect(mSTP, mDTP)(TeaIndex); // this returns a new component