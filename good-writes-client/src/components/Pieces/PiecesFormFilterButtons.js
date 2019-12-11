import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import ToggleButtonGroup from 'react-bootstrap/ToggleButtonGroup';
import ToggleButton from 'react-bootstrap/ToggleButton';

export default function PiecesFormFilterButtons(props) {

  return(
    <ButtonToolbar >
      <ToggleButtonGroup className={props.className} type="radio" name="options" onChange={value => props.setFilter(value)}>
        <ToggleButton variant='success'>All</ToggleButton>
        <ToggleButton variant='success' value='Poetry'>Poetry</ToggleButton>
        <ToggleButton variant='success' value='Fiction'>Fiction</ToggleButton>
        <ToggleButton variant='success' value='Non-Fiction'>Non-Fiction</ToggleButton>
      </ToggleButtonGroup>
    </ButtonToolbar>
  )

}