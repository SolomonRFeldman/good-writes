import React from 'react';
import Card from 'react-bootstrap/Card';

export default function Comment(props) {

  return(
    <Card style={{width: '800px'}} className='mx-auto my-4'>
      <Card.Header>
        {<h2 className='d-inline-block mb-n5 mt-n1'>{props.comment.author_alias} said,</h2>}
      </Card.Header>
      <Card.Body>
        <p className='mb-0 my-n2'>{props.comment.content}</p>
      </Card.Body>
    </Card>
  )

}