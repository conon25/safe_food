import axios from "axios";
axios.defaults.withCredentials = true;
export default axios.create({
  baseURL: "http://192.168.210.71:8080",
  headers: {
    "Content-type": "application/json"
  }
});