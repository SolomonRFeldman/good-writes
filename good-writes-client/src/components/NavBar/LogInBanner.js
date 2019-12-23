import React from 'react';
import SessionButtons from '../Session/SessionButtons';
import { connect } from 'react-redux';
import UserBanner from '../Users/UserBanner';

function LogInBanner(props) {

  return (
    props.currentUser.token ?
      <UserBanner className={props.className} currentUser={props.currentUser} /> :
      <SessionButtons className={props.className} />
  )

}

export default connect(({ currentUser }) => ({ currentUser }), null)(LogInBanner)