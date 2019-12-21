const configObj = (method) => {
  const obj = {
    method: method,
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    }
  }
  return localStorage.token ? {...obj, headers: { ...obj.headers, "Token": localStorage.token }} : obj
}

export const getRequest = (url) => {
  return fetch(url, configObj("GET")).then(response => response.json())
}

export const deleteRequest = (url) => {
  return fetch(url, configObj("DELETE")).then(response => response.json())
}

const configObjWithBody = (method, body) => {
  return { ...configObj(method), body: JSON.stringify(body) }
}

export const postRequest = (url, body) => {
  return fetch(url, configObjWithBody("POST", body)).then(response => response.json())
}

export const patchRequest = (url, body) => {
  return fetch(url, configObjWithBody("PATCH", body)).then(response => response.json())
}