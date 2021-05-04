import React from 'react';
import { Provider } from 'react-redux';
import App from './app';

// root embraces the children, provider included
// you only need to use Provider once, and only need to plug in store once in Provider
// all other components live in the App component
const Root = ({ store }) => { // we can destructure props in the argument, ES6 
  // const store = props.store
  debugger

  // you must pass the store to Provider with 'store'
  return (
    <Provider store={store}>
      <App />
    </Provider>
  )
}

export default Root;