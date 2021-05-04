import configureStore from './store/store'
import { receiveTea } from './actions/tea_actions'
import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import * as TeaAPIUtil from "./util/tea_api_util";

const oolongTea = {
  id: 1,
  flavor: "oolong",
  amount: 2.75
}

const matchaTea = {
  id: 2,
  flavor: 'matcha',
  amount: 5.00,
}

const jasmineTea = {
  id: 3,
  flavor: 'jasmine',
  amount: 3.00
}

document.addEventListener("DOMContentLoaded", () => {
  // console.log("Welcome to the magic tea shop.")
  debugger
  const store = configureStore();
  window.store = store;
  // window.receiveGreenTea = receiveGreenTea;
  window.receiveTea = receiveTea;
  debugger
  // list of teas to test 
  window.oolongTea = oolongTea;
  window.matchaTea = matchaTea;
  window.jasmineTea = jasmineTea;
  window.TeaAPIUtil = TeaAPIUtil;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
})