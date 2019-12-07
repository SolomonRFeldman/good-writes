import React, { useEffect } from 'react';
import LogInButtons from '../LogIn/LogInButtons';
import { connect } from 'react-redux';
import UserBanner from '../Users/UserBanner';

function LogInBanner(props) {

  useEffect(() => console.log(props))

  return (
    props.token ?
      <UserBanner className={props.className} currentUser={props.currentUser} /> :
      <LogInButtons className={props.className} />
  )

}

const mapStateToProps = ({ token, currentUser }) => ({ token, currentUser })

export default connect(mapStateToProps, null)(LogInBanner)