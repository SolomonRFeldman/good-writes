import React from 'react';
import { connect } from 'react-redux';
import Groups from './Groups/Groups';
import NewGroupButton from './Groups/NewGroupButton';

function Home(props) {
  return(
    <React.Fragment>
      <h1 className="display-3 text-center">Groups</h1>
      {props.currentUser.token ? <NewGroupButton className='mt-4 mx-auto d-block' /> : null}
      <Groups currentUser={props.currentUser} />
    </React.Fragment>
  )
}

const mapStateToProps = ({ currentUser }) => ({ currentUser })

export default connect(mapStateToProps, null)(Home)