import { render } from 'preact';
import { useEffect, useState } from 'preact/hooks';
import './style.css';

export function App() {
	let [date, setDate] = useState(new Date());
	useEffect(() => {
	  let timer = setInterval(() => setDate(new Date()), 1000);
	  return function cleanup() {
		clearInterval(timer);
	  };
	});
	return (
	  <div className="App">
		<p> Date: {date.toLocaleDateString()} </p>
		<h2> Time:{date.toLocaleTimeString()} </h2>
	  </div>
	);
}


function Resource(props) {
	return (
		<a href={props.href} target="_blank" class="resource">
			<h2>{props.title}</h2>
			<p>{props.description}</p>
		</a>
	);
}

render(<App />, document.getElementById('app'));
