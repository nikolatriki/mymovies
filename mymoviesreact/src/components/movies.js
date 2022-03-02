import React from 'react';

function Movies(props) {
  return (
    <div>
      <h1>This is a list of my movies</h1>
      {props.movies.map((movie) => {
        return (
          <div key={movie.id}>
            <h2>{movie.title}</h2>
          </div>
        );
      })}
    </div>
  );
}

export default Movies;
