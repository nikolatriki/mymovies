import './App.css';
import axios from 'axios';
import { useEffect, useState } from 'react';
import { Table } from 'antd'


const API_URL = 'http://localhost:3000/api/v1/movies';

function getAPIData() {
  return axios.get(API_URL).then((response) => response.data);
}

function App() {
  const [movies, setMovies] = useState([]);

  const columns = [
    {
      title: 'ID',
      dataIndex: 'id',
      width: 10,
    },
    {
      title: 'Title',
      dataIndex: 'title',
      width: 150,
    },
    {
      title: 'Year',
      dataIndex: 'year',
      width: 20,
    },
    {
      title: 'Rating',
      dataIndex: 'rating',
      width: 20,
    },
    {
      title: 'Expert_rating',
      dataIndex: 'expert_rating',
      width: 20,
    },
    {
      title: 'Watched?',
      width: 20,
      render: movie => {
        return <p>{movie.watched?'True' : 'False'}</p>
      }
    },
  ];

  const data = movies.map(row => ({ 
    id: row.id, 
    title: row.title, 
    year: row.year, 
    rating: row.rating,
    expert_rating: row.expert_rating,
    watched: row.watched 
  }));
    
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
      <Table columns={columns} dataSource={data}/>
    </div>
  );
}

export default App;
