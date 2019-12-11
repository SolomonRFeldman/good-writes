import React from 'react';
import { connect } from 'react-redux';
import Groups from './Groups/Groups';

function Home(props) {
  return(
    <React.Fragment>
      <Groups currentUser={props.currentUser} />
    </React.Fragment>
  )
}

const mapStateToProps = ({ currentUser }) => ({ currentUser })

export default connect(mapStateToProps, null)(Home)