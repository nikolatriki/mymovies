import './App.css';
import axios from 'axios';
import Movies from './/components/movies';
import { useEffect, useState } from 'react';

const API_URL = 'http://localhost:3000/api/v1/movies';

function getAPIData() {
  return axios.get(API_URL).then((response) => response.data);
}

function App() {
  const [movies, setMovies] = useState([]);

  useEffect(() => {
    let mounted = true;
    getAPIData().then((items) => {
      if(mounted) {
        setMovies(items);
      }
    });
    return() => { mounted = false };
  }, []);

  return (
    <div className="App">
      <Movies movies={movies}/>
    </div>
  );
}

export default App;
