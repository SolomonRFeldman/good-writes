const configObj = (method) => {
  const obj = {
    method: method,
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    }
  }
  if(localStorage.token) obj.headers = { ...obj.headers, "Token": localStorage.token }
  return obj
}

export const getRequest = (url) => {
  return fetch(url, configObj("GET")).then(response => response.json())
}