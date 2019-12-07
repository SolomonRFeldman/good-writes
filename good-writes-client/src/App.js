import React, { useEffect } from 'react';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import NavBar from './components/NavBar/NavBar';
import { connect } from 'react-redux'



function App(props) {

  useEffect(() => {
    if(localStorage.token) {
      const configObj = {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: JSON.stringify({ token: localStorage.token })
      }
      
      fetch('/login', configObj).then(response => response.json()).then(json => {
        props.addCurrentUser(json)
        localStorage.token = json.token
      })
    }
  })

  return (
    <div className="App">
      <header>
        <NavBar />
      </header>
    </div>
  );
}

const mapDispatchToProps = dispatch => ({ addCurrentUser: payload => { dispatch({ type: "ADD_CURRENT_USER", payload }) } })

export default connect(null, mapDispatchToProps)(App)
