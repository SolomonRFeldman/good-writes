import React, { useEffect, useRef } from 'react';
import Navbar from 'react-bootstrap/Navbar';
import LogInBanner from './LogInBanner';
import { Link, Redirect } from 'react-router-dom';
import { connect } from 'react-redux'

function NavBar(props) {

  const redirect = () => { if(props.redirect) {
    const path = props.redirect
    props.resetRedirectTrigger()
    return <Redirect push to={path} /> 
  }}

  console.log(props.redirect)

  return (
    <Navbar className={props.className} bg='dark' variant='dark'>
      <Navbar.Brand as={Link} to='/'>Good Writes</Navbar.Brand>
      <LogInBanner className='ml-auto' />
      {redirect()}
    </Navbar>
  );

}

const mapStateToProps = ({ redirect }) => ({ redirect })
const mapDispatchToProps = dispatch => ({ resetRedirectTrigger: payload => { dispatch({ type: 'RESET_REDIRECT_TRIGGER', payload }) } })

export default connect(mapStateToProps, mapDispatchToProps)(NavBar)