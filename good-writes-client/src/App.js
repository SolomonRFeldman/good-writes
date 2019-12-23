import React, { useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import NavBar from './components/NavBar/NavBar';

import { BrowserRouter as Router, Route } from 'react-router-dom';
import Home from './components/Home';
import User from './components/Users/User';
import PieceShow from './components/Pieces/PieceShow';
import GroupShow from './components/Groups/GroupShow';

import { useDispatch } from 'react-redux';
import { fetchUser } from './actions/userActions';



export default function App(props) {
  const dispatch = useDispatch()
  useEffect(() => {
    if(localStorage.token) {
      dispatch(fetchUser())
    }
  }, [])

  return (
    <Router>
      <div className="App">
        <header>
          <NavBar className='fixed-top w-100' />
        </header>
        <div style={{paddingTop: '56px'}}>
          <Route exact path='/' component={Home} />
          <Route exact path='/users/:id' component={User} />
          <Route exact path='/users/:user_id/pieces/:id' component={PieceShow} />
          <Route exact path='/groups/:id' component={GroupShow} />
        </div>
      </div>
    </Router>
  );
}
