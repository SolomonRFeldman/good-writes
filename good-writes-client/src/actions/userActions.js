export const fetchUser = () => {
  return (dispatch) => {
    const configObj = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ token: localStorage.token })
    }
    
    fetch('/login', configObj).then(response => response.json()).then(json => {
      dispatch({type: 'ADD_CURRENT_USER' ,payload: json})
      localStorage.token = json.token
    })
  }
}