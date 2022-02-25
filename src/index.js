import './index.css';
import React from 'react';
import ReactDOM from 'react-dom';

import App from './App';
import { Elm } from './App.elm';

const elmApp = Elm.App.init({ node: document.getElementById('elm-root') });

ReactDOM.render(<App ports={elmApp.ports} />, document.getElementById('root'));
