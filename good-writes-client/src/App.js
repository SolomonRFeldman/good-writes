import React, { useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import NavBar from './components/NavBar/NavBar';

import { BrowserRouter as Router, Route } from 'react-router-dom';
import Home from './components/Home';
import User from './components/Users/User';
import PieceShow from './components/Pieces/PieceShow';
import GroupShow from './components/Groups/GroupShow';

import { connect } from 'react-redux';
import { fetchUser } from './actions/userActions';



function App(props) {

  useEffect(() => {
    if(localStorage.token) {
      props.fetchUser()
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

const mapDispatchToProps = dispatch => ({ fetchUser: () => dispatch(fetchUser()) })

export default connect(null, mapDispatchToProps)(App)
