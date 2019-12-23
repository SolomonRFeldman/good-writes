import React from 'react';
import SessionButtons from '../Session/SessionButtons';
import { useSelector } from 'react-redux';
import UserBanner from '../Users/UserBanner';

export default function LogInBanner(props) {
  const currentUser = useSelector(state => state.currentUser)

  return (
    currentUser.token ?
      <UserBanner className={props.className} currentUser={currentUser} /> :
      <SessionButtons className={props.className} />
  )
}