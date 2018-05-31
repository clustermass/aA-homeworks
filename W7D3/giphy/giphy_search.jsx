import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
// import Root from './components/root';

import { fetchSearchGiphys } from './util/api_util'
import { receiveSearchGiphys } from './actions/giphy_actions'



document.addEventListener(`DOMContentLoaded`, ()=> {
  const store = configureStore();
  const root = document.getElementById('root')

  window.store = store
  window.receiveSearchGiphys = receiveSearchGiphys
  window.fetchSearchGiphys = fetchSearchGiphys

  ReactDOM.render(element, root);

});

const element = (
    <div>
      <h1>Hello, world!</h1>
      <h2>It is {new Date().toLocaleTimeString()}.</h2>
    </div>)
