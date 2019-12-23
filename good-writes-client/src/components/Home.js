import React from 'react';
import { useSelector } from 'react-redux';
import Groups from './Groups/Groups';
import NewGroupButton from './Groups/NewGroupButton';

export default function Home(props) {
  const currentUser = useSelector(state => state.currentUser)
  return(
    <React.Fragment>
      <h1 className="display-3 text-center">Groups</h1>
      {currentUser.token ? <NewGroupButton className='mt-4 mx-auto d-block' /> : null}
      <Groups currentUser={currentUser} />
    </React.Fragment>
  )
}
