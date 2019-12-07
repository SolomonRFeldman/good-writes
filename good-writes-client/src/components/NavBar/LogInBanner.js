import React, { useEffect } from 'react';
import SessionButtons from '../Session/SessionButtons';
import { connect } from 'react-redux';
import UserBanner from '../Users/UserBanner';

function LogInBanner(props) {

  useEffect(() => console.log(props))

  return (
    props.token ?
      <UserBanner className={props.className} currentUser={props.currentUser} /> :
      <SessionButtons className={props.className} />
  )

}

const mapStateToProps = ({ token, currentUser }) => ({ token, currentUser })

export default connect(mapStateToProps, null)(LogInBanner)